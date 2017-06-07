require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#remove_class" do
    it "returns if input is nil" do
      result = MarkdownMedia.remove_class([])

      expect(result).to eq(nil)
    end

    it "strips class:foo if is present in input" do
      result = MarkdownMedia.remove_class(["this is a string with", "class:something-in-it"])

      expect(result).to eq("something-in-it")
    end

    it "return nil if no class:foo is present in input" do
      result = MarkdownMedia.remove_class(["something", "something-else"])

      expect(result).to eq(nil)
    end
  end
end
