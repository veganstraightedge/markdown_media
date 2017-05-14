require "spec_helper"

RSpec.describe MarkdownMedia do
  describe "#expanded_embed" do
    it "finds an image embed" do
      result = MarkdownMedia.expanded_embed("http://example.com/photo.png")

      expected_result = {
        locals: {
          embed_id: "http://example.com/photo.png",
          caption:  nil,
          link:     nil,
          id:       nil
        }
      }

      expect(result).to eq(expected_result)
    end

    it "finds an image embed with a caption" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption"
      )

      expected_result = {
        locals: {
          embed_id: "http://example.com/photo.png",
          caption:  "photo caption",
          link:     nil,
          id:       nil
        }
      }

      expect(result).to eq(expected_result)
    end

    it "finds an image embed with a caption and link" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption",
        link:    "http://example.com/linked-destination"
      )

      expected_result = {
        locals: {
          embed_id: "http://example.com/photo.png",
          caption:  "photo caption",
          link:     "http://example.com/linked-destination",
          id:       nil
        }
      }

      expect(result).to eq(expected_result)
    end

    it "finds an image embed with a caption, link and id" do
      result = MarkdownMedia.expanded_embed(
        "http://example.com/photo.png",
        caption: "photo caption",
        link:    "http://example.com/linked-destination",
        id:      "foo"
      )

      expected_result = {
        locals: {
          embed_id: "http://example.com/photo.png",
          caption:  "photo caption",
          link:     "http://example.com/linked-destination",
          id:       "foo"
        }
      }

      expect(result).to eq(expected_result)
    end
  end
end
