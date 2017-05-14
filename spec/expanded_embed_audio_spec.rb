require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for audio" do
    it "finds an audio embed" do
      result = MarkdownMedia.expanded_embed("http://example.com/audio.mp3")

      expect_result = %q{<figure id=""><audio controls><source src="http://example.com/audio.mp3" /></audio></figure>}
      expect(strip_html_whitespace(result)).to eq(expect_result)
    end

    it "finds an audio embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/audio.mp3",
        caption: "audio caption"
      )

      expect_result = %q{<figure id=""><audio controls><source src="http://example.com/audio.mp3" /></audio><figcaption class="caption audio-caption">audio caption</figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expect_result)
    end

    it "finds an audio embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
      "http://example.com/audio.mp3",
        caption: "audio caption",
        link:    "http://example.com/linked-destination"
      )

      expect_result = %q{<figure id=""><audio controls><source src="http://example.com/audio.mp3" /></audio><figcaption class="caption audio-caption">audio caption</figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expect_result)
    end

    it "finds an audio embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/audio.mp3",
        caption: "audio caption",
        link:    "http://example.com/linked-destination",
        id:      "audio"
      )

      expect_result = %q{<figure id="audio"><audio controls><source src="http://example.com/audio.mp3" /></audio><figcaption class="caption audio-caption">audio caption</figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expect_result)
    end
  end
end
