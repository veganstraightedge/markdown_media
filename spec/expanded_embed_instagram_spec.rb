require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for instagram" do
    it "finds an instagram embed" do
      result = MarkdownMedia.expanded_embed("https://www.instagram.com/p/BQtnoADAZ1m/?taken-by=veganstraightedge")

      expect(strip_html_whitespace(result)).to match("instagram-media")
    end

    it "finds an instagram embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "https://www.instagram.com/p/BQtnoADAZ1m/",
        caption: "instagram caption"
      )

      expect(strip_html_whitespace(result)).to match("instagram-media")
    end

    it "finds an instagram embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "https://www.instagram.com/p/BQtnoADAZ1m/",
        caption: "instagram caption",
        link:    "http://example.com/linked-destination"
      )

      expect(strip_html_whitespace(result)).to match("instagram-media")
    end

    it "finds an instagram embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "https://www.instagram.com/p/BQtnoADAZ1m/",
        caption: "instagram caption",
        link:    "http://example.com/linked-destination",
        id:      "instagram-id"
      )

      expect(strip_html_whitespace(result)).to match("instagram-media")
      expect(strip_html_whitespace(result)).to match("instagram-id")
    end
  end
end
