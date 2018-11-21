require 'spec_helper'

RSpec.describe SourceCode do
  describe '#initialize' do
    simple_embed           = SourceCode.new(content: '[[ http://example.com/image.png ]]')
    simple_captioned_embed = SourceCode.new(content: '[[ http://example.com/image.png caption ]]')
    simple_ided_embed      = SourceCode.new(content: '[[ http://example.com/image.png id:test ]]')

    it 'requires a content parameter' do
      expect { SourceCode.new }.to raise_error(ArgumentError)
    end

    it 'is valid with required content parameter' do
      expect { simple_embed }.to_not raise_error
    end

    it 'sets @content as readable' do
      expect(simple_embed.content).to be_truthy
    end

    it 'strips wrapping double brackets' do
      expect(simple_embed.content).to eq 'http://example.com/image.png'
    end

    it 'sets @url as readable' do
      expect(simple_embed.url).to be_truthy
    end

    it 'extracts @url from content' do
      expect(simple_captioned_embed.url).to eq 'http://example.com/image.png'
    end

    it 'sets @pieces as readable' do
      expect(simple_captioned_embed.pieces).to be_truthy
    end

    xit 'must start with a URL' do
      expect(SourceCode.new(content: '[[ caption ]]')).to raise_error(TypeError)
    end

    it 'sets @id as readable' do
      expect(simple_ided_embed.id).to be_truthy
    end

    it 'extracts @url from content' do
      expect(simple_captioned_embed.url).to eq 'http://example.com/image.png'
    end

  end
end
