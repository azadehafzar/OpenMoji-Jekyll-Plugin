# OpenMoji Jekyll Plugin

OpenMoji Emoji plugin for Jekyll

## Usage

Add the following to your site's `Gemfile`

```
gem 'jekyll-openmoji'
```

And add the following to your site's `_config.yml`

```yml
plugins:
  - jekyll-openmoji
```

💡 If you are using a Jekyll version less than 3.5.0, use the `gems` key instead of `plugins`.

In any page or post, use emoji as you would normally, e.g.

```markdown
I give this plugin two :+1:!
```

## Emoji images

For all sites emoji images are served from the GitHub.com CDN, with a
base URL of `https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin`,
which results in emoji image URLs like
`https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin/emoji/unicode/1f604.svg`.

## Customizing

If you'd like to serve emoji images locally, or use a custom emoji source, you can specify so in your `_config.yml` file:

```yml
emoji:
  src: "/assets/images/emoji"
```
