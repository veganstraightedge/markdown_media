require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#render_erb" do
    it "renders the proper template" do
      locals = { embed_id: "http://example.com/photo.png", caption: "photo caption", link: "http://example.com", id: "photo" }
      result = MarkdownMedia.render_erb("image", locals)

      expected_result = %q{<figure id="photo"><a href="http://example.com"><img src="http://example.com/photo.png" /></a><figcaption><p>photo caption</p></figcaption></figure>}
      expect(strip_html_whitespace(result)).to eq(expected_result)
    end
  end
end
