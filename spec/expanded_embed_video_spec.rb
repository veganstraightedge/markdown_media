require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for video" do
    it "finds an video embed" do
      result = MarkdownMedia.expanded_embed("http://example.com/video.mp4")

      expected_result = %q{<figure class="video-container " id=""><video controls><source src="http://example.com/video.mp4" /></video></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an video embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/video.mp4",
        caption: "video caption"
      )

      expected_result = %q{<figure class="video-container " id=""><video controls><source src="http://example.com/video.mp4" /></video><figcaption class="caption video-caption"><p>video caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an video embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/video.mp4",
        caption: "video caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = %q{<figure class="video-container " id=""><video controls><source src="http://example.com/video.mp4" /></video><figcaption class="caption video-caption"><p>video caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an video embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/video.mp4",
        caption: "video caption",
        link:    "http://example.com/linked-destination",
        id:      "video"
      )

      expected_result = %q{<figure class="video-container " id="video"><video controls><source src="http://example.com/video.mp4" /></video><figcaption class="caption video-caption"><p>video caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
