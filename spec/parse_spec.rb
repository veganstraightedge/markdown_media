require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "EMBED_REGEX constant" do
    it "is not nil" do
      expect(MarkdownMedia::EMBED_REGEX).to_not eq(nil)
    end
  end

  describe "#parse" do
    it "returns a string" do
      result = MarkdownMedia.parse("lorem ipsum")

      expect(result).to eq("lorem ipsum")
    end
  end
end
