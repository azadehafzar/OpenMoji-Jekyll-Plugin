# frozen_string_literal: true

require "jekyll"
require "negarmoji"
require "html/pipeline"
require "html/pipeline/negarmoji-pipeline"

module Jekyll
  class Emoji
    # Extend negarmoji emoji class.

    # Default configuration.
    DEFAULT_HOST_URL = "https://cdn.jsdelivr.net/gh/azadeh-afzar/OpenMoji-Jekyll-Plugin@latest"
    DEFAULT_ASSET_PATH = "/images/color/svg"
    DEFAULT_DIR = "/emoji"
    DEFAULT_EXTENSION = "svg"
    DEFAULT_IMG_ATTRS = { "class"  => "emoji",
                          "height" => "20",
                          "width"  => "20",
                          "align"  => nil, }
    # Regex values.
    FILE_NAME = "/:file_name"
    BODY_START_TAG = "<body"
    OPENING_BODY_TAG_REGEX = %r!<body(.*?)>\s*!m.freeze

    class << self
      def emojify(doc)
        return unless
            doc.output =~ HTML::Pipeline::NegarMojiHtmlPipeline::NegarehEmojiFilter
                            .emoji_pattern

        doc.output = if doc.output.include? BODY_START_TAG
                       replace_document_body(doc)
                     else
                       src_root = emoji_src_root(doc.site.config)
                       asset_path = emoji_asset_path(doc.site.config)
                       file_extension = emoji_extension(doc.site.config)
                       img_attrs = emoji_attributes(doc.site.config)
                       filter_with_emoji(src_root, asset_path, file_extension,
                                         img_attrs).call(doc.output)[:output].to_s
                     end
      end

      # Public: Create or fetch the filter for the given {{src_root}} asset root.
      #
      # :src_root - the asset root URL (e.g. https://cdn.jsdelivr.net/gh/azadeh-afzar/OpenMoji-Jekyll-Plugin@latest)
      # :asset_path - the asset sub-path of src (e.g. "/images/color/svg")
      # [default = "emoji"].
      #
      # :extension - the extension of emoji image files, [default = svg ].
      #
      # :img_attrs - the custom css properties for emoji <img> tag.
      #
      # examples of _config.yml:
      #   1. user provided all URLs:
      #       emoji:
      #           src: https://example.com/asset
      #           asset: /images/png
      #   emoji files will serve from https://example.com/asset/images/png
      #
      #   2. user provided just src:
      #       emoji:
      #           src: https://example.com/asset
      #   emoji files will serve from https://example.com/emoji
      #
      #   3. user provided nothing:
      #   emoji files will serve from https://cdn.jsdelivr.net/gh/azadeh-afzar/OpenMoji-Jekyll-Plugin@latest/images/color/svg
      #
      # Returns an HTML::Pipeline instance for the given asset root.
      def filter_with_emoji(src_root, asset_path, file_extension, img_attrs)
        filters[src_root] ||= HTML::Pipeline.new([HTML::Pipeline::
                NegarMojiHtmlPipeline::NegarehEmojiFilter],
                                                 :asset_root => src_root,
                                                 :asset_path => asset_path,
                                                 :extension  => file_extension,
                                                 :img_attrs  => img_attrs)
      end

      # Public: Filters hash where the key is the asset root source.
      # Effectively a cache.
      def filters
        @filters ||= {}
      end

      # Public: Calculate the asset root source for the given config.
      # The custom emoji asset root can be defined in the config as
      # emoji.src, and must be a valid URL (i.e. it must include a
      # protocol and valid domain).
      #
      # config - the hash-like configuration of the document's site.
      #
      # Returns a full URL to use as the asset root URL. Defaults to the root
      # URL for assets provided by an ASSET_HOST_URL environment variable,
      # otherwise the root URL for emoji assets at https://cdn.jsdelivr.net/gh/azadeh-afzar/OpenMoji-Jekyll-Plugin@latest.
      def emoji_src_root(config = {})
        if config.key?("emoji") && config["emoji"].key?("src")
          config["emoji"]["src"]
        else
          default_asset_root
        end
      end

      # Public: Calculate the asset root source for the given config.
      # The custom emoji asset root can be defined in the config as
      # emoji.asset.
      #
      # If emoji.asset isn't defined, its value will explicitly set to "emoji".
      #
      # config - the hash-like configuration of the document's site.
      #
      # Returns a string to use as the asset path. Defaults to the ASSET_PATH.
      def emoji_asset_path(config = {})
        if config.key?("emoji") && config["emoji"].key?("src")
          if config["emoji"].key?("asset")
            config["emoji"]["asset"].chomp("/") + FILE_NAME.to_s
          else
            "#{DEFAULT_DIR}#{FILE_NAME}"
          end
        else
          "#{DEFAULT_ASSET_PATH}#{FILE_NAME}"
        end
      end

      # Public: return extension for emoji files.
      # The custom emoji extension can be defined in the config as
      # emoji.extension.
      #
      # If emoji.extension isn't defined, its value will explicitly set to "svg".
      #
      # config - the hash-like configuration of the document's site.
      #
      # Returns a string to use as the extension. Defaults to the DEFAULT_EXTENSION.
      def emoji_extension(config = {})
        if config.key?("emoji") && config["emoji"].key?("extension")
          config["emoji"]["extension"]
        else
          DEFAULT_EXTENSION.to_s
        end
      end

      # Public: return emoji <img> tag attributes.
      # The custom emoji css attributes can be defined with emoji.img_attrs.
      #
      # for example:
      #
      # emoji:
      #   img_attrs:
      #     class: "openmoji"
      #     height: 30
      #
      # this will override default emoji css attributes.
      #
      # If emoji.img_attrs isn't defined, its value will explicitly set to
      # DEFAULT_IMG_ATTRS.
      #
      # config - the hash-like configuration of the document's site
      #
      # Returns a hash to use as the attributes. Defaults to the DEFAULT_IMG_ATTRS.
      def emoji_attributes(config = {})
        if config.key?("emoji") && config["emoji"].key?("img_attrs")
          # merge default values with custom values and then
          # convert hash keys to symbols.
          DEFAULT_IMG_ATTRS.merge!(config["emoji"]["img_attrs"])
            .map { |key, value| [key.to_sym, value] }.to_h
        else
          # convert hash keys to symbols.
          DEFAULT_IMG_ATTRS.map { |key, value| [key.to_sym, value] }.to_h
        end
      end

      # Public: Defines the conditions for a document to be emojiable.
      #
      # doc - the Jekyll::Document or Jekyll::Page
      #
      # Returns true if the doc is written & is HTML.
      def emojiable?(doc)
        (doc.is_a?(Jekyll::Page) || doc.write?) &&
          doc.output_ext == ".html" || (doc.permalink&.end_with?("/"))
      end

      private

      def default_asset_root
        if !ENV["ASSET_HOST_URL"].to_s.empty?
          # Ensure that any trailing "/" is trimmed
          asset_host_url = ENV["ASSET_HOST_URL"].chomp("/")
          asset_host_url.to_s
        else
          DEFAULT_HOST_URL.to_s
        end
      end

      def replace_document_body(doc)
        src_root = emoji_src_root(doc.site.config)
        asset_path = emoji_asset_path(doc.site.config)
        file_extension = emoji_extension(doc.site.config)
        img_attrs = emoji_attributes(doc.site.config)
        head, opener, tail = doc.output.partition(OPENING_BODY_TAG_REGEX)
        body_content, *rest = tail.partition("</body>")
        processed_markup = filter_with_emoji(src_root, asset_path, file_extension,
                                             img_attrs).call(body_content)[:output]
                             .to_s
        String.new(head) << opener << processed_markup << rest.join
      end
    end
  end
end

Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  Jekyll::Emoji.emojify(doc) if Jekyll::Emoji.emojiable?(doc)
end
