<p align="center">
  <br>
  <a href="#">
    <img src="https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin/images/logo/OpenMoji-logo.svg" width="100"/>
  </a>
</p>

<h1 align="center">OpenMoji Jekyll Plugin</h1>
<h3 align="center">Beautiful OpenMoji emojis on your Jekyll websites.</h3>
<p align="center">
<a href="https://openmoji.org">OpenMoji</a> is a free and open source emoji library which can be used
 for variety of purposes.</p>

<p align="center">
  <a title="Open Source" href="https://opensource.com/resources/what-open-source/">
    <img src="https://img.shields.io/badge/Open%20Source-Forever-brightgreen?style=flat-square" alt="Open Source">
  </a>
  <a title="License: GPL v3" href="https://www.opensource.org/licenses/GPL-3.0">
    <img src="https://img.shields.io/badge/License-GPL%20v3-blue?style=flat-square&logo=gnu" alt="License: GPL v3">
  </a>
  <a title="OpenMoji Version" href="https://github.com/hfg-gmuend/openmoji/releases/tag/12.0.0">
    <img src="https://img.shields.io/badge/OpenMoji-v12.0.0-yellow?style=flat-square" alt="OpenMoji Version">
  </a>
  <a title="Gem Version" href="https://rubygems.org/gems/negarmoji">
    <img src="https://img.shields.io/badge/Jekyll%20OpenMoji-v0.0.1-yellow?style=flat-square" alt="Gem Version">
  </a>
  <a title="jsDelivr CDN" href="https://www.jsdelivr.com/package/gh/azadeh=afzar/OpenMoji-Jekyll-Plugin">
    <img src="https://data.jsdelivr.com/v1/package/gh/azadeh=afzar/OpenMoji-Jekyll-Plugin/badge" alt="jsDelivr CDN">
  </a>
  <br>
  <br>
</p>

> This project is a fork of <a href="https://github.com/jekyll/jeomi">Jemoji</a>. It's also independent from OpenMoji project.

### Enjoy a free open source emoji package
Use more than 3,000 emoji from OpenMoji package for free in your jekyll website.

### Connect to any other emoji source
Use any available emoji package from a CDN or locally served emoji images by adding only 3 lines to your website's config file.

## Quick start

### 1. Add the following to your site's `Gemfile`

```ruby
gem 'jekyll-openmoji'
```

### 2. Add the following to your site's `_config.yml`

```yaml
plugins:
  - jekyll-openmoji
```

### 3. Next steps

In any page or post, use emoji as you would normally, e.g.

```markdown
I give this plugin two :+1:!
```

### Customizing

If you'd like to serve emoji images locally, or use a custom emoji source,
you can specify so in your `_config.yml` file:

```yaml
emoji:
  # src key is required .
  # images will be served from this base address
  # it must be a valid URL, if you don't provide a string to src key
  # plugin will ignore this settings and uses default settings.
  src: "https://www.emojisource.com"

  # asset key is optional.
  # it will be appended to the end of src keyword to make a complete URL,
  # if you don't provide the asset value, it will be defaulted to "emoji".
  asset: "/color/svg"

# final path will be  "https://www.emojisource.com/color/svg" and
# emoji images will serve from this address.
# in case of no asset value, final path would be  "https://www.emojisource.com/color/svg"emoji


```

## How it works

For all sites emoji images are served from the GitHub.com CDN, with a
base URL of `https://cdn.jsdelivr.net/gh/azadeh-afzar/OpenMoji-Jekyll-Plugin@latest` and
asset path of `/images/color/svg`, which results in emoji image URLs like
`https://cdn.jsdelivr.net/gh/azadeh-afzar/OpenMoji-Jekyll-Plugin@latest/images/color/svg/1f604.svg`.

However you can alter the default path in `_config.yml` to serve from external sources.

### Notes

Emoji files names should be unicode strings, for example name of this emoji 😄 image file must be: 1f604

## Countribution

If you want to contribute to this project, please read [CONTRIBUTION](CONTRIBUTION.md).

## Code of Conduct

Visit the [Code of Conduct](CODE_OF_CONDUCT.md).

## Roadmap

Visit the [Roadmap](ROADMAP.md) to keep track of which features we are currently working on.

## License

Licensed under the [GPL v3](LICENSE).

## Attribution
1. All default emojis designed by [OpenMoji](https://openmoji.org)- the open source emoji and icon project. License: CC BY-SA 4.0
2. This project is a fork of [Jemoji](https://github.com/jekyll/jemoji).
