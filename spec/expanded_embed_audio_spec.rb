require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for audio" do
    it "finds an audio embed" do
      result = MarkdownMedia.expanded_embed("http://example.com/audio.mp3")

      expected_result = %q{<figure id="" class=""><audio controls><source src="http://example.com/audio.mp3" /></audio></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an audio embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/audio.mp3",
        caption: "audio caption"
      )

      expected_result = %q{<figure id="" class=""><audio controls><source src="http://example.com/audio.mp3" /></audio><figcaption class="caption audio-caption"><p>audio caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an audio embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
      "http://example.com/audio.mp3",
        caption: "audio caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = %q{<figure id="" class=""><audio controls><source src="http://example.com/audio.mp3" /></audio><figcaption class="caption audio-caption"><p>audio caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an audio embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/audio.mp3",
        caption: "audio caption",
        link:    "http://example.com/linked-destination",
        id:      "audio"
      )

      expected_result = %q{<figure id="audio" class=""><audio controls><source src="http://example.com/audio.mp3" /></audio><figcaption class="caption audio-caption"><p>audio caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
