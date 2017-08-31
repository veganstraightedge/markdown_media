require "markdown_media/version"
require "open-uri"
require "erb"
require "kramdown"

module MarkdownMedia
  EMBED_REGEX = /\[\[\s*(http[^\]\s]+(?:\s.+)?)\s*\]\]/

  class << self
    def parse(text)
      output = text.gsub(EMBED_REGEX) do
        embed_tag = $1

        unless embed_tag.to_s.empty?
          embed_tag_pieces = embed_tag.split(" ")

          url     = embed_tag_pieces.shift
          id      = remove_id(embed_tag_pieces)
          klass   = remove_class(embed_tag_pieces)
          type    = remove_type(embed_tag_pieces)

          link    = unless embed_tag_pieces.to_s.empty?
            embed_tag_pieces.pop if url_or_path?(embed_tag_pieces.last)
          end

          caption = embed_tag_pieces.join(" ")

          expanded_embed(url, caption: caption, link: link, id: id, type: type, klass: klass)
        end
      end

      output
    end

    def url_or_path?(string)
      string =~ /^(http|\/)\S+/ ? true : false
    end

    def remove_class(pieces)
      return if pieces.to_s.empty?

      klass_string = pieces.detect { |piece| piece =~ /class:\S+/ }

      if klass_string
        klass = klass_string.split(":").last
        pieces.delete(klass_string)

        klass
      end
    end

    def remove_id(pieces)
      return if pieces.to_s.empty?

      id_string = pieces.detect { |piece| piece =~ /id:\S+/ }

      if id_string
        id = id_string.split(":").last
        pieces.delete(id_string)

        id
      end
    end

    def remove_type(pieces)
      return if pieces.to_s.empty?

      type_string = pieces.detect { |piece| piece =~ /type:\S+/ }

      if type_string
        type = type_string.split(":").last
        pieces.delete(type_string)

        type
      end
    end

    def expanded_embed(url, caption: nil, link: nil, id: nil, type: nil, klass: nil)
      url  = URI.parse(url)

      case url.host
      when /youtube.com/
        slug     = "youtube"
        embed_id = nil

        url.query.split("&").each do |key_value_pair|
          argument, value = key_value_pair.split("=")
          if argument == "v"
            embed_id = value
          end
        end

      when "youtu.be"
        slug     = "youtube"
        embed_id = url.path.split("/").map{ |path_piece| path_piece unless path_piece.to_s.empty? }.compact.first

      when /dailymotion.com/
        slug     = "dailymotion"
        embed_id = url.path.split("/video/").map{ |path_piece| path_piece unless path_piece.to_s.empty? }.compact.first.split("_").first

      when "vimeo.com"
        slug     = "vimeo"
        embed_id = url.path.split("/").map{ |path_piece| path_piece unless path_piece.to_s.empty? }.compact.first

      when "twitter.com"
        slug     = "twitter"
        type   ||= "tweet"

      when /instagram/
        slug     = "instagram"

      else
        slug = case url.path

        when /\.mp3|\.aac|\.wav|\.ogg|\.oga|\.m4a/
          "audio"
        when /\.mp4|\.avi|\.mov|\.ogv|\.webm|\.m4v|\.3gp|\.m3u8/
          "video"
        when /\.png|\.jpeg|\.jpg|\.gif|\.svg/
          "image"
        else
          "link"
        end
      end

      render_erb slug, { embed_id: embed_id || url.to_s, caption: caption, link: link, id: id, type: type, klass: klass }
    end

    def render_erb(template_slug, locals)
      template_path = "/templates/#{template_slug}.erb"
      template      = File.read(File.expand_path File.dirname(__FILE__) + template_path)

      embed_id = locals[:embed_id]
      caption  = locals[:caption]
      link     = locals[:link]
      id       = locals[:id]
      type     = locals[:type]
      klass    = locals[:klass]

      erb = ERB.new(template)
      erb.result(binding)
    end

    def render_markdown(text)
      ::Kramdown::Document.new(
        text,
        input: :kramdown,
        remove_block_html_tags: false,
        transliterated_header_ids: true
      ).to_html
    end

  end
end
