<p align="center">
  <br>
  <a href="#">
    <img src="images/logo/OpenMoji-logo.svg" width="100" alt="OpenMoji Jekyll Plugin"/>
  </a>
</p>

<h1 align="center">OpenMoji Jekyll Plugin</h1>
<h3 align="center">Bring beautiful OpenMoji emojis to your Jekyll websites.</h3>
<p align="center">
    <a href="https://openmoji.org">
        OpenMoji
    </a> 
    is a free and open source emoji library which can be used
    for variety of purposes. it is licensed under CC BY-SA 4.0 .
</p>

<p align="center">
  <a title="Open Source" href="https://opensource.com/resources/what-open-source" target="_blank">
    <img src="https://img.shields.io/badge/Open%20Source-Forever-brightgreen?logo=open-source-initiative&style=flat-square" alt="Open Source">
  </a>
  <a title="License: GPLv3" href="https://www.opensource.org/licenses/GPL-3.0" target="_blank">
    <img src="https://img.shields.io/github/license/azadeh-afzar/OpenMoji-Jekyll-Plugin?logo=gnu&style=flat-square" alt="License: GPLv3">
  </a>
  <a title="Language counter" href="#" target="_blank">
    <img src="https://img.shields.io/github/languages/count/azadeh-afzar/OpenMoji-Jekyll-Plugin?logo=gitlab&style=flat-square" alt="Language counter">
  </a>
  <a title="Top language" href="#" target="_blank">
    <img src="https://img.shields.io/github/languages/top/azadeh-afzar/OpenMoji-Jekyll-Plugin?logo=gitlab&style=flat-square" alt="Top language">
  </a>
  
  <br>
  
  <a title="Code Quality: Codefactor.io" href="https://www.codefactor.io/repository/github/azadeh-afzar/openMoji-jekyll-plugin" target="_blank">
    <img src="https://www.codefactor.io/repository/github/azadeh-afzar/openMoji-jekyll-plugin/badge?style=flat-square" alt="CodeFactor"/>
  </a>
  <a title="Code Quality: CodeClimate.com" href="https://codeclimate.com/github/azadeh-afzar/OpenMoji-Jekyll-Plugin/maintainability" target="_blank">
    <img src="https://img.shields.io/codeclimate/maintainability/azadeh-afzar/OpenMoji-Jekyll-Plugin?logo=code-climate&style=flat-square" alt="CodeClimate rating"/>
  </a>
  <a title="Code Technical Debt: CodeClimate.com" href="https://codeclimate.com/github/azadeh-afzar/OpenMoji-Jekyll-Plugin/maintainability" target="_blank">
    <img src="https://img.shields.io/codeclimate/tech-debt/azadeh-afzar/OpenMoji-Jekyll-Plugin?logo=code-climate&style=flat-square" alt="CodeClimate technical debt"/>
  </a>
  <a title="Code Issues: CodeClimate.com" href="https://codeclimate.com/github/azadeh-afzar/OpenMoji-Jekyll-Plugin/maintainability" target="_blank">
    <img src="https://img.shields.io/codeclimate/issues/azadeh-afzar/OpenMoji-Jekyll-Plugin?logo=code-climate&style=flat-square" alt="CodeClimate issues"/>
  </a>
  
  <br>

  <a title="GitLab: pipeline status" href="https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin/commits/master" target="_blank">
    <img src="https://img.shields.io/gitlab/pipeline/Web-Development/OpenMoji-Jekyll-Plugin?gitlab_url=https%3A%2F%2Fgitlab.com%2FAzadeh-Afzar&logo=gitlab&style=flat-square"  alt="pipeline status" />
  </a>
  <a title="Test Coverage: CodeClimate.com" href="https://codeclimate.com/github/azadeh-afzar/OpenMoji-Jekyll-Plugin" target="_blank">
    <img src="https://img.shields.io/codeclimate/coverage/azadeh-afzar/OpenMoji-Jekyll-Plugin?logo=code-climate&style=flat-square" alt="CodeClimate"/>
  </a>
  
  <br>

  <a title="OpenMoji Version" href="https://github.com/hfg-gmuend/openmoji/releases/tag/12.0.0">
    <img src="https://img.shields.io/badge/OpenMoji-v12.0.0-yellow?style=flat-square" alt="OpenMoji Version">
  </a>
  <a title="Gem Version" href="https://rubygems.org/gems/negarmoji">
    <img src="https://img.shields.io/badge/Jekyll%20OpenMoji-v0.0.1-yellow?style=flat-square" alt="Gem Version">
  </a>
  <a title="jsDelivr CDN" href="https://www.jsdelivr.com/package/gh/azadeh=afzar/OpenMoji-Jekyll-Plugin">
    <img src="https://data.jsdelivr.com/v1/package/gh/azadeh=afzar/OpenMoji-Jekyll-Plugin/badge" alt="jsDelivr CDN">
  </a>
</p>

> If you are viewing this repository on GitHub, this GitHub repository is a mirror of the OpenMoji Jekyll Plugin,
> the main repository is served on 
><a href="https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin">GitLab</a>, all developments and
>discussions, issue tracking and merge requests take place in GitLab.  

> This project is a fork of <a href="https://github.com/jekyll/jeomi">Jemoji</a>. 
> This project is currently independent from main OpenMoji project.

### Enjoy a free open source emoji package
Use more than 3,000 emoji from OpenMoji package for free in your jekyll website.

### Connect to any other emoji source
Use any available emoji package from a CDN or locally served emoji images by adding
roughly 5 lines to your website's config file.

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
  # for other emoji packs providing a src key is required.
  # images will be served from this base address
  # it must be a valid URL, if you don't provide a string to src key
  # plugin will ignore this settings and uses default settings which
  # is OpenMoji emoji pack.
  src: "https://www.emojisource.com"

  # asset key is optional.
  # it will be appended to the end of src keyword to make a complete URL,
  # if you don't provide the asset value, it will be defaulted to "emoji".
  # you can also provide an empty string "" if your source doesn't have any asset path.
  asset: "/color/png"

  # final path will be  "https://www.emojisource.com/color/svg" and
  # emoji images will serve from this address.
  # in case of no asset value, final path would be  "https://www.emojisource.com/color/svg"emoji

  # MORE CONFIGURATION OPTIONS
  # all configs below are optional.

  # default emoji image extension is svg (vector file), but if your emoji source
  # images are in other formats, you can manually override default extension by using below key
  # and specify your desired extension (png, jpg, jpeg, bmp, etc).
  extension: png

```

## How it works

For all sites emoji images are served from a GitHub.com CDN, with a
base URL of `https://cdn.jsdelivr.net/gh/azadeh-afzar/OpenMoji-Jekyll-Plugin@latest` and
asset path of `/images/color/svg`, which results in emoji image URLs like
`https://cdn.jsdelivr.net/gh/azadeh-afzar/OpenMoji-Jekyll-Plugin@latest/images/color/svg/1f604.svg`.

However you can alter the default path in `_config.yml` to serve from external sources.

### Notes

Emoji files names should be lowercase unicode strings, for example name of this
emoji 😄 image file must be: 1f604

## Contribution

If you want to contribute to this project, please read [CONTRIBUTING](CONTRIBUTING.md).

## Code of Conduct

Visit the [Code of Conduct](CODE_OF_CONDUCT.md).

## Roadmap

Visit the [Roadmap](ROADMAP.md) to keep track of which features we are currently
working on.

## License

Licensed under the [GPL v3](LICENSE).

## Attribution
1. All default emojis designed by [OpenMoji](https://openmoji.org) - the open source
emoji and icon project. License: CC BY-SA 4.0
2. This project is a fork of [Jemoji](https://github.com/jekyll/jemoji). License: MIT
