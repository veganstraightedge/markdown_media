require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed to not include_media" do
    it "finds an link embed" do
      result = MarkdownMedia.expanded_embed(
                 "https://twitter.com/veganstraightedge/status/863151253911511040",
                 include_media: false
               )

      expected_result = %q{<a href="https://twitter.com/veganstraightedge/status/863151253911511040" id="" class="">twitter.com/veganstraightedge/status/863151253911511040</a>}

      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an link embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "https://twitter.com/veganstraightedge/status/863151253911511040",
        caption: "link caption",
        include_media: false
      )

      expected_result = %q{<a href="https://twitter.com/veganstraightedge/status/863151253911511040" id="" class="">link caption</a>}

      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an link embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "https://twitter.com/veganstraightedge/status/863151253911511040",
        caption: "link caption",
        link:    "http://example.com/linked-destination",
        include_media: false
      )

      expected_result = %q{<a href="https://twitter.com/veganstraightedge/status/863151253911511040" id="" class="">link caption</a>}

      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an link embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "https://twitter.com/veganstraightedge/status/863151253911511040",
        caption: "link caption",
        link:    "http://example.com/linked-destination",
        id:      "link",
        include_media: false
      )

      expected_result = %q{<a href="https://twitter.com/veganstraightedge/status/863151253911511040" id="link" class="">link caption</a>}

      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
