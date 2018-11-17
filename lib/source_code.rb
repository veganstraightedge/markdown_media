class SourceCode
  attr_reader :content

  def initialize content:
    @content = content
    strip_brackets!
  end

  private

  def strip_brackets!
    @content.gsub!('[[', '').gsub!(']]', '').strip!
  end
end
