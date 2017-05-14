require "markdown_media/version"

module MarkdownMedia
  class << self
    def parse(text)
      output = text
      output
    end


    def url_or_path?(string)
      string =~ /^(http|\/)\S+/ ? true : false
    end
  end
end
