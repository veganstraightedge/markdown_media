require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for link" do
    it "finds an link embed" do
      result = MarkdownMedia.expanded_embed("http://example.com/something/unknown")

      expected_result = %q{<a href="http://example.com/something/unknown" id="" class="">example.com/something/unknown</a>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an link embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/something/unknown",
        caption: "link caption"
      )

      expected_result = %q{<a href="http://example.com/something/unknown" id="" class="">link caption</a>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an link embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/something/unknown",
        caption: "link caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = %q{<a href="http://example.com/something/unknown" id="" class="">link caption</a>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an link embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/something/unknown",
        caption: "link caption",
        link:    "http://example.com/linked-destination",
        id:      "link"
      )

      expected_result = %q{<a href="http://example.com/something/unknown" id="link" class="">link caption</a>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
