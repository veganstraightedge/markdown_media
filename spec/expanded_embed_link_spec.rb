require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for image" do
    it "finds an image embed" do
      result = MarkdownMedia.expanded_embed("http://example.com/photo.png")

      expect_result = %q{<figure id=""><img src="http://example.com/photo.png" /></figure>}
      expect(strip_html_whitespace(result)).to eq(expect_result)
    end

    it "finds an image embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption"
      )

      expect_result = %q{<figure id=""><img src="http://example.com/photo.png" /><figcaption>photo caption</figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expect_result)
    end

    it "finds an image embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption",
        link:    "http://example.com/linked-destination"
      )

      expect_result = %q{<figure id=""><a href="http://example.com/linked-destination"><img src="http://example.com/photo.png" /></a><figcaption>photo caption</figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expect_result)
    end

    it "finds an image embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption",
        link:    "http://example.com/linked-destination",
        id:      "photo"
      )

      expect_result = %q{<figure id="photo"><a href="http://example.com/linked-destination"><img src="http://example.com/photo.png" /></a><figcaption>photo caption</figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expect_result)
    end
  end
end
