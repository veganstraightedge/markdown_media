require "spec_helper"

describe "MarkdownMedia#url_or_path?" do
  it "finds a URL" do
    result = MarkdownMedia.url_or_path?("http://example.com")

    expect(result).to eq(true)
  end

  it "finds a path" do
    result = MarkdownMedia.url_or_path?("/path")

    expect(result).to eq(true)
  end

  it "balks at a non-URL/path" do
    result = MarkdownMedia.url_or_path?("neither path nor URL")

    expect(result).to eq(false)
  end
end
