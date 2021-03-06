require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for giphy" do
    it "finds a giphy embed" do
      result = MarkdownMedia.expanded_embed("https://giphy.com/gifs/dog-animal-friendship-4k5gSMvd1yr60")

      expected_result = %q{<figure class="video-container " id=""><div style="width:100%;height:0;padding-bottom:56%;position:relative;"><iframe src="https://giphy.com/embed/4k5gSMvd1yr60" width="100%" height="100%" frameborder="0" class="giphy-embed" webkitallowfullscreen mozallowfullscreen allowFullScreen></iframe></div></figure>}

      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "find a giphy embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "https://giphy.com/gifs/dog-animal-friendship-4k5gSMvd1yr60",
        caption: "giphy gif caption"
      )

      expected_result = %q{<figure class="video-container " id=""><div style="width:100%;height:0;padding-bottom:56%;position:relative;"><iframe src="https://giphy.com/embed/4k5gSMvd1yr60" width="100%" height="100%" frameborder="0" class="giphy-embed" webkitallowfullscreen mozallowfullscreen allowFullScreen></iframe></div><figcaption class="caption video-caption video-caption-giphy"><p>giphy gif caption</p></figcaption></figure>}

      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds a giphy embed with a caption and a link" do
      result = MarkdownMedia.expanded_embed(
        "https://giphy.com/gifs/dog-animal-friendship-4k5gSMvd1yr60",
        caption: "giphy gif caption",
        link: "http://example.com/linked-destination"
      )

      expected_result = %q{<figure class="video-container " id=""><div style="width:100%;height:0;padding-bottom:56%;position:relative;"><iframe src="https://giphy.com/embed/4k5gSMvd1yr60" width="100%" height="100%" frameborder="0" class="giphy-embed" webkitallowfullscreen mozallowfullscreen allowFullScreen></iframe></div><figcaption class="caption video-caption video-caption-giphy"><p>giphy gif caption</p></figcaption></figure>}

      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds a giphy with caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "https://giphy.com/gifs/dog-animal-friendship-4k5gSMvd1yr60",
        caption: "giphy gif caption",
        link: "http://example.com/linked-destination",
        id: 'giphy-content-id'
      )

      expected_result = %q{<figure class="video-container " id="giphy-content-id"><div style="width:100%;height:0;padding-bottom:56%;position:relative;"><iframe src="https://giphy.com/embed/4k5gSMvd1yr60" width="100%" height="100%" frameborder="0" class="giphy-embed" webkitallowfullscreen mozallowfullscreen allowFullScreen></iframe></div><figcaption class="caption video-caption video-caption-giphy"><p>giphy gif caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
