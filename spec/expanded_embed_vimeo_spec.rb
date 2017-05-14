require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for vimeo" do
    it "finds an vimeo embed" do
      result = MarkdownMedia.expanded_embed("https://vimeo.com/116239463")

      expected_result = %q{<figure class="video-container" id=""><iframe src="https://player.vimeo.com/video/116239463?title=0&amp;byline=0&amp;portrait=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an vimeo embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "https://vimeo.com/116239463",
        caption: "vimeo caption"
      )

      expected_result = %q{<figure class="video-container" id=""><iframe src="https://player.vimeo.com/video/116239463?title=0&amp;byline=0&amp;portrait=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><figcaption class="caption video-caption video-caption-vimeo"><p>vimeo caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an vimeo embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "https://vimeo.com/116239463",
        caption: "vimeo caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = %q{<figure class="video-container" id=""><iframe src="https://player.vimeo.com/video/116239463?title=0&amp;byline=0&amp;portrait=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><figcaption class="caption video-caption video-caption-vimeo"><p>vimeo caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an vimeo embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "https://vimeo.com/116239463",
        caption: "vimeo caption",
        link:    "http://example.com/linked-destination",
        id:      "vimeo"
      )

      expected_result = %q{<figure class="video-container" id="vimeo"><iframe src="https://player.vimeo.com/video/116239463?title=0&amp;byline=0&amp;portrait=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><figcaption class="caption video-caption video-caption-vimeo"><p>vimeo caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
