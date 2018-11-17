class SourceCode
  attr_reader :content, :url, :pieces

  # URL, then a space, then optional caption/id/class/link
  EMBED_REGEX = /(http[^\]\s]+(?:\s.+)?)/.freeze

  def initialize content:
    @content = content
    strip_brackets!
    validate_url_presence
    split_content_into_pieces!
    extract_url!
  end

  private

  def strip_brackets!
    @content.gsub!('[[', '').gsub!(']]', '').strip!
  end

  def validate_url_presence
    matched_content = content.match(EMBED_REGEX)
    raise TypeError, "Expected to start with a URL" if matched_content.to_s.empty?
  end

  def split_content_into_pieces!
    matched_content = content.match(EMBED_REGEX)

    matched_content = matched_content[1]

    @pieces = matched_content.split
  end

  def extract_url!
    @url = @pieces.shift
  end

end
