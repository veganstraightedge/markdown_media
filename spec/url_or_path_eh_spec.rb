require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#url_or_path?" do
    it "finds a URL and returns true" do
      result = MarkdownMedia.url_or_path?("http://example.com")

      expect(result).to eq(true)
    end

    it "finds a path and returns true" do
      result = MarkdownMedia.url_or_path?("/path")

      expect(result).to eq(true)
    end

    it "returns false if a non-URL/path" do
      result = MarkdownMedia.url_or_path?("neither path nor URL")

      expect(result).to eq(false)
    end
  end
end
