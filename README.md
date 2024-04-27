# Markdown Media

[![Code Climate](https://codeclimate.com/github/veganstraightedge/markdown_media/badges/gpa.svg)](https://codeclimate.com/github/veganstraightedge/markdown_media)
![Version 1.8.0](https://img.shields.io/badge/VERSION-1.8.0-green.svg)

This syntax uses doubles square brackets on each side of a URL and optional options.
It expands into the current preferred embed code for that site’s media or raw media.
Supported media types: YouTube, Vimeo, Instagram, Twitter, Daily Motion, images, videos, audios.


## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'markdown_media'
```

And then execute:

```sh
bundle
```

Or install it yourself as:

```sh
gem install markdown_media
```


## Usage

### As a Writer

This a syntax that can sit on top of Markdown (or any templating format, except MediaWiki which already uses the double square bracket syntax). The purpose is to simplify adding images (with or without caption and optionally linked), videos, tweets, audio, etc for writers in a CMS. The HTML that we want for a video is different from an image. But as a writer, it’s conceptually the same, “here’s a piece of media and its caption, stick it in the page right here”.

So, the media embed syntax makes it so you don’t have to think about the differences between YouTube, Vimeo, Twitter and an image. Here’s how it works.

There are six pieces. Some are required. Some are optional. It must always be on one line. But for explanation here, I’ll put them on separate lines, then tie it all together.

```
[[
media URL
caption
link URL (for images only)
HTML id
HTML class
type (used for Twitter video)
]]
```

Here’s what they all mean.

- **Required**. Always put a blank line above the media embed
- **Required**. Always start the media embed with two left square brackets (no space between them).
- **Required**. Always add an absolute URL to the media. (More on supported URLs below)
- **Optional**. You can add a caption to images, videos, audios. Not for tweets though. The caption is processed as Markdown. So, you can use links, bold, and italics within the caption.
- **Optional**. You can add a URL that will be used to link the image. This can only be used for images, not video, audio, or tweets.
- **Optional**. If you need the media to have a certain id on the generated HTML (so that you can link to it), you can add id:desired-id-with-no-spaces as the last item in the media embed.
- **Required**. Always end the media embed with two right square brackets (no space between them).
- **Required**. Always put a blank line below the media embed

### As a Developer

```ruby
MarkdownMedia.parse('[[https://example.com/photo.png]]')
```

In Rails, you might also need to add `.html_safe` to avoid escaping.

```ruby
MarkdownMedia.parse('[[https://example.com/photo.png]]').html_safe
```

### Examples

#### Images

A simple image.

```
[[https://example.com/image.png]]
```

An image with a caption.

```
[[https://example.com/image.png Look at me, I’m a caption!]]
```

An image with Markdown in the caption.

```
[[https://example.com/image.png _Look at me_, I’m a **caption**!]]
```

An image linked to a URL (requires a caption present).

```
[[https://example.com/image.png Some caption https://example.com/some/path]]
```

An image linked to a path (requires a caption present).

```
[[https://example.com/image.png Some caption /books/work]]
```

#### Videos

A simple video.

```
[[https://example.com/video.mp4]]
```

A video with a caption.

```
[[https://example.com/video.mp4 Even videos can have captions. Yay!]]
```

A video from Vimeo.

```
[[https://vimeo.com/2696386]]
```

A video from Vimeo with caption.

```
[[https://vimeo.com/2696386 History of the Internet]]
```

A video from YouTube.

```
[[https://www.youtube.com/watch?v=YX40hbAHx3s]]
```

A video from YouTube with caption.

```
[[https://www.youtube.com/watch?v=YX40hbAHx3s P vs. NP and the Computational Complexity Zoo]]
```

YouTube’s short URL format also works.

```
[[https://youtu.be/YX40hbAHx3s]]
```

YouTube’s embed URL format also works.

```
[[https://www.youtube.com/embed/YX40hbAHx3s]]
```

A video from Daily Motion.

```
[[http://www.dailymotion.com/video/x5gwr1v_anarchists-in-rojava-announce-irpgf_news]]
```

A video from Twitter.

```
[[https://twitter.com/Breaking911/status/900211169734131713 type:video]]
```

A video/gif from Giphy.

```
[[https://giphy.com/gifs/cat-funny-OrNbkY7oQOrh6]]
```

A video/gif from Giphy with caption.

```
[[https://giphy.com/gifs/cat-funny-OrNbkY7oQOrh6 Dogs and cats are buddies.]]
```

#### Audio

A simple audio.

```
[[https://example.com/sound.mp3]]
```

A simple audio with caption.

```
[[https://example.com/sound.aac Sounds can have captions.]]
```

#### Links

Any URL in a [[]] block that is unrecognized, just gets rendered into a linked URL.

```
[[https://veganstraightedge.com/cancer]]
```

That gets turned into this.

```html
<a href='https://veganstraightedge.com/cancer'>https://veganstraightedge.com/cancer</a>.
```

If you try to embed some piece of media and it renders to a URL that means that that kind of URL isn’t supported yet. But don’t distress, new sites are pretty easy to add. So, raise a flag in Slack or GitHub Issues.

### Supported Media URLs

Here are the currently supported URLs and media types.

#### Videos

- https://example.com/video.mp4
- https://example.com/video.avi
- https://example.com/video.mov
- https://example.com/video.ogv
- https://example.com/video.webm
- https://example.com/video.m4v
- https://example.com/video.3gp
- https://example.com/video.m3u8
- https://vimeo.com/1234
- https://www.youtube.com/watch?v=video-id
- https://youtu.be/video-id
- http://www.dailymotion.com/video/video-id_video-slug
- https://twitter.com/Breaking911/status/900211169734131713
- https://giphy.com/gifs/cat-funny-OrNbkY7oQOrh6

#### Audios

- https://example.com/audio.mp3
- https://example.com/audio.aac
- https://example.com/audio.wav
- https://example.com/audio.ogg
- https://example.com/audio.oga
- https://example.com/audio.m4a

#### Images

- https://example.com/image.png
- https://example.com/image.jpeg
- https://example.com/image.jpg
- https://example.com/image.gif
- https://example.com/image.svg

#### Tweets

- https://twitter.com/veganstraightedge/status/854782420591165440


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/veganstraightedge/markdown_media. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

### Contributors

* Shane Becker <veganstraightedge@gmail.com>
* Morgan Fogarty <mofo37@gmail.com>
* Matt Pruitt <guitsaru@gmail.com>
* Justin Lavoie <just1602@riseup.net>
* astronaut-wannabe <contact@astronaut-wannabe.com>

## License

**PUBLIC DOMAIN**

Your heart is as free as the air you breathe. <br>
The ground you stand on is liberated territory.

In legal text, *Markdown Media* is dedicated to the public domain
using Creative Commons — CC0 1.0 Universal.

[http://creativecommons.org/publicdomain/zero/1.0](http://creativecommons.org/publicdomain/zero/1.0 "Creative Commons — CC0 1.0 Universal")
