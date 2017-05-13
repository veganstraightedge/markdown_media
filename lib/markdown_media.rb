require "markdown_media/version"

module MarkdownMedia
  class << self
    def url_or_path?(string)
      string.match?(/^(http|\/)\S+/)
    end
  end
end
