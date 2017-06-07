require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed for image" do
    it "finds an image embed" do
      result = MarkdownMedia.expanded_embed("http://example.com/photo.png")

      expected_result = %q{<figure id="" class=""><img src="http://example.com/photo.png" /></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an image embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption"
      )

      expected_result = %q{<figure id="" class=""><img src="http://example.com/photo.png" /><figcaption><p>photo caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an image embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = %q{<figure id="" class=""><a href="http://example.com/linked-destination"><img src="http://example.com/photo.png" /></a><figcaption><p>photo caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an image embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption",
        link:    "http://example.com/linked-destination",
        id:      "photo"
      )

      expected_result = %q{<figure id="photo" class=""><a href="http://example.com/linked-destination"><img src="http://example.com/photo.png" /></a><figcaption><p>photo caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end

    it "finds an image embed with a caption, link, id and class" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption",
        link:    "http://example.com/linked-destination",
        id:      "photo",
        klass:   "some-class"
      )

      expected_result = %q{<figure id="photo" class="some-class"><a href="http://example.com/linked-destination"><img src="http://example.com/photo.png" /></a><figcaption><p>photo caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
