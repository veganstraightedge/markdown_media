require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expended embed for youtube" do
    it "finds a kolektiva embed with a standard kolektiva video URL" do
      result = MarkdownMedia.expanded_embed("https://kolektiva.media/w/qYSQJdR4wPGSNFY1CxrZJ4")

      expected_result = %q{<figure class="video-container " id=""><iframe src="https://kolektiva.media/videos/embed/qYSQJdR4wPGSNFY1CxrZJ4" frameborder="0" allowfullscreen sandbox="allow-same-origin allow-scripts allow-popups"></iframe></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds a kolektiva embed with an embed kolektiva video URL" do
      result = MarkdownMedia.expanded_embed("https://kolektiva.media/w/qYSQJdR4wPGSNFY1CxrZJ4")

      expected_result = %q{<figure class="video-container " id=""><iframe src="https://kolektiva.media/videos/embed/qYSQJdR4wPGSNFY1CxrZJ4" frameborder="0" allowfullscreen sandbox="allow-same-origin allow-scripts allow-popups"></iframe></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds a kolektiva embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "https://kolektiva.media/w/qYSQJdR4wPGSNFY1CxrZJ4",
        caption: "Kolektiva caption"
      )

      expected_result = %q{<figure class="video-container " id=""><iframe src="https://kolektiva.media/videos/embed/qYSQJdR4wPGSNFY1CxrZJ4" frameborder="0" allowfullscreen sandbox="allow-same-origin allow-scripts allow-popups"></iframe><figcaption class="caption video-caption video-caption-kolektiva"><p>Kolektiva caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds a kolektiva embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "https://kolektiva.media/w/qYSQJdR4wPGSNFY1CxrZJ4",
        caption: "Kolektiva caption",
        link: "http://example.com/linked-destination"
      )

      expected_result = %q{<figure class="video-container " id=""><iframe src="https://kolektiva.media/videos/embed/qYSQJdR4wPGSNFY1CxrZJ4" frameborder="0" allowfullscreen sandbox="allow-same-origin allow-scripts allow-popups"></iframe><figcaption class="caption video-caption video-caption-kolektiva"><p>Kolektiva caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds a kolektiva embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "https://kolektiva.media/w/qYSQJdR4wPGSNFY1CxrZJ4",
        caption: "Kolektiva caption",
        link: "http://example.com/linked-destination",
        id: "some-id"
      )

      expected_result = %q{<figure class="video-container " id="some-id"><iframe src="https://kolektiva.media/videos/embed/qYSQJdR4wPGSNFY1CxrZJ4" frameborder="0" allowfullscreen sandbox="allow-same-origin allow-scripts allow-popups"></iframe><figcaption class="caption video-caption video-caption-kolektiva"><p>Kolektiva caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
