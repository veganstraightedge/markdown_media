require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed" do
    it "finds an image embed" do
      result = MarkdownMedia.expanded_embed("http://example.com/photo.png")

      expected_result = "http://example.com/photo.png   "

      expect(result).to eq(expected_result)
    end

    it "finds an image embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption"
      )

      expected_result = "http://example.com/photo.png photo caption  "

      expect(result).to eq(expected_result)
    end

    it "finds an image embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = "http://example.com/photo.png photo caption http://example.com/linked-destination "

      expect(result).to eq(expected_result)
    end

    it "finds an image embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption",
        link:    "http://example.com/linked-destination",
        id:      "foo"
      )

      expected_result = "http://example.com/photo.png photo caption http://example.com/linked-destination foo"

      expect(result).to eq(expected_result)
    end
  end
end
