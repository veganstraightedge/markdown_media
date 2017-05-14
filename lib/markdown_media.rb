require "markdown_media/version"

module MarkdownMedia
  class << self
    def parse(text)
      output = ""



      output
    end

    # def expanded_embeds(post)
    #   embed_regex = /\[\[\s*(http[^\]\s]+(?:\s.+)?)\s*\]\]/
    #
    #   output_content = post.content.gsub(embed_regex) do |match|
    #     embed_tag = $1
    #
    #     if embed_tag.present?
    #       embed_tag_pieces = embed_tag.split(" ")
    #
    #       url     = embed_tag_pieces.shift
    #       id      = remove_id(embed_tag_pieces)
    #       link    = if embed_tag_pieces.present?
    #         embed_tag_pieces.pop if url_or_path?(embed_tag_pieces.last)
    #       end
    #       caption = embed_tag_pieces.join(" ")
    #
    #       expanded_embed(url, caption: caption, link: link, id: id)
    #     end
    #   end
    #
    #   post.content = output_content
    #   post
    # end


    def url_or_path?(string)
      string =~ /^(http|\/)\S+/ ? true : false
    end
  end
end
