require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#render_erb" do
    it "renders an inline template as string" do
      locals = { embed_id: "1234", caption: "photo caption", link: "http://example.com", id: "foo" }
      result = MarkdownMedia.render_erb("image", locals)

      expect(result).to eq("1234 photo caption http://example.com foo")
    end
  end
end
