require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#parse" do
    it "returns a string" do
      result = MarkdownMedia.parse("lorem ipsum")

      expect(result).to eq("lorem ipsum")
    end
  end
end
