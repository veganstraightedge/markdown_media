require "markdown_media/version"

module MarkdownMedia
  EMBED_REGEX = /\[\[\s*(http[^\]\s]+(?:\s.+)?)\s*\]\]/

  class << self
    def parse(text)
      output = text.gsub(EMBED_REGEX) do |match|
        embed_tag = $1

        unless embed_tag.to_s.empty?
          embed_tag_pieces = embed_tag.split(" ")

          url     = embed_tag_pieces.shift
          # id      = remove_id(embed_tag_pieces)
          link    = if embed_tag_pieces.to_s.empty?
            embed_tag_pieces.pop if url_or_path?(embed_tag_pieces.last)
          end
          caption = embed_tag_pieces.join(" ")

          # expanded_embed(url, caption: caption, link: link)
          # , id: id

          [url, caption, link]
        end
      end

      output
    end

    def url_or_path?(string)
      string =~ /^(http|\/)\S+/ ? true : false
    end
  end
end
