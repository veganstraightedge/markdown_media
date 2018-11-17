require 'spec_helper'

RSpec.describe SourceCode do
  describe '#initialize' do
    simple_image_embed           = SourceCode.new(content: '[[ http://example.com/image.png ]]')
    simple_captioned_image_embed = SourceCode.new(content: '[[ http://example.com/image.png caption ]]')

    it 'requires a content parameter' do
      expect { SourceCode.new }.to raise_error(ArgumentError)
    end

    it 'is valid with required content parameter' do
      expect { simple_image_embed }.to_not raise_error
    end

    it 'sets @content as readable' do
      expect(simple_image_embed.content).to be_truthy
    end

    it 'strips wrapping double brackets' do
      expect(simple_image_embed.content).to eq 'http://example.com/image.png'
    end

    it 'sets @url as readable' do
      expect(simple_image_embed.url).to be_truthy
    end

    it 'extracts @url from content' do
      expect(simple_captioned_image_embed.url).to eq 'http://example.com/image.png'
    end

    it 'sets @pieces as readable' do
      expect(simple_captioned_image_embed.pieces).to be_truthy
    end

    xit 'must start with a URL' do
      expect(SourceCode.new(content: '[[ caption ]]')).to raise_error(TypeError)
    end
  end
end
