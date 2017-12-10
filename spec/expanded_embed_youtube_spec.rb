require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for youtube" do
    it "finds an youtube embed" do
      result = MarkdownMedia.expanded_embed("https://www.youtube.com/watch?v=YX40hbAHx3s")

      expected_result = %q{<figure class="video-container " id=""><iframe width="560" height="315" src="https://www.youtube.com/embed/YX40hbAHx3s" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an youtube embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "https://www.youtube.com/watch?v=YX40hbAHx3s",
        caption: "youtube caption"
      )

      expected_result = %q{<figure class="video-container " id=""><iframe width="560" height="315" src="https://www.youtube.com/embed/YX40hbAHx3s" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe><figcaption class="caption video-caption video-caption-youtube"><p>youtube caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an youtube embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "https://www.youtube.com/watch?v=YX40hbAHx3s",
        caption: "youtube caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = %q{<figure class="video-container " id=""><iframe width="560" height="315" src="https://www.youtube.com/embed/YX40hbAHx3s" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe><figcaption class="caption video-caption video-caption-youtube"><p>youtube caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an youtube embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "https://www.youtube.com/watch?v=YX40hbAHx3s",
        caption: "youtube caption",
        link:    "http://example.com/linked-destination",
        id:      "youtube"
      )

      expected_result = %q{<figure class="video-container " id="youtube"><iframe width="560" height="315" src="https://www.youtube.com/embed/YX40hbAHx3s" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe><figcaption class="caption video-caption video-caption-youtube"><p>youtube caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
