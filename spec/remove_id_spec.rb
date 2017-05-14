require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#remove_id" do
    it "returns if input is nil" do
      result = MarkdownMedia.remove_id([])

      expect(result).to eq(nil)
    end

    it "strips id:foo if is present in input" do
      result = MarkdownMedia.remove_id(["this is a string with", "id:something-in-it"])

      expect(result).to eq("something-in-it")
    end

    it "return nil if no id:foo is present in input" do
      result = MarkdownMedia.remove_id(["something", "something-else"])

      expect(result).to eq(nil)
    end
  end
end
