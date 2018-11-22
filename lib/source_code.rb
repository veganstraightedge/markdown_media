class SourceCode
  attr_reader :content, :url, :pieces, :id, :klass

  # URL, then a space, then optional caption/id/class/link
  EMBED_REGEX = /(http[^\]\s]+(?:\s.+)?)/.freeze

  def initialize content:
    @content = content
    strip_brackets!
    validate_url_presence
    split_content_into_pieces!
    extract_url!
    extract_id!
    extract_klass!
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

  def extract_id!
    return if @pieces.to_s.empty?

    id_string = @pieces.detect { |piece| piece =~ /id:\S+/ }

    return unless id_string

    @id = id_string.split(':').last
    @pieces.delete(id_string)
  end

  def extract_klass!
    return if @pieces.to_s.empty?

    klass_string = @pieces.detect { |piece| piece =~ /class:\S+/ }

    return unless klass_string

    @klass = klass_string.split(":").last
    @pieces.delete(klass_string)
  end
end
