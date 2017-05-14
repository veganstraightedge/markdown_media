require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for dailymotion video" do
    it "finds an dailymotion embed" do
      result = MarkdownMedia.expanded_embed("https://www.dailymotion.com/video/x5h2f98_from-rojava-to-belarus-solidarity-with-the-anarchist-prisoners_news")

      expected_result = %q{<figure class="video-container" id=""><iframe frameborder="0" src="//www.dailymotion.com/embed/video/x5h2f98" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an dailymotion embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "https://www.dailymotion.com/video/x5h2f98_from-rojava-to-belarus-solidarity-with-the-anarchist-prisoners_news",
        caption: "dailymotion video caption"
      )

      expected_result = %q{<figure class="video-container" id=""><iframe frameborder="0" src="//www.dailymotion.com/embed/video/x5h2f98" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><figcaption class="caption video-caption video-caption-vimeo"><p>dailymotion video caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an dailymotion embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "https://www.dailymotion.com/video/x5h2f98_from-rojava-to-belarus-solidarity-with-the-anarchist-prisoners_news",
        caption: "dailymotion video caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = %q{<figure class="video-container" id=""><iframe frameborder="0" src="//www.dailymotion.com/embed/video/x5h2f98" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><figcaption class="caption video-caption video-caption-vimeo"><p>dailymotion video caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an dailymotion embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "https://www.dailymotion.com/video/x5h2f98_from-rojava-to-belarus-solidarity-with-the-anarchist-prisoners_news",
        caption: "dailymotion video caption",
        link:    "http://example.com/linked-destination",
        id:      "dailymotion"
      )

      expected_result = %q{<figure class="video-container" id="dailymotion"><iframe frameborder="0" src="//www.dailymotion.com/embed/video/x5h2f98" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe><figcaption class="caption video-caption video-caption-vimeo"><p>dailymotion video caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
