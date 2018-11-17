require 'spec_helper'

RSpec.describe SourceCode do
  describe '#initialize' do
    it 'requires a content parameter' do
      expect { SourceCode.new }.to raise_error(ArgumentError)
    end

    it 'is valid with required content parameter' do
      expect { SourceCode.new(content: '[[ http://example.com/image.png ]]') }.to_not raise_error
    end

    it 'sets @content as readable' do
      expect(SourceCode.new(content: '[[ http://example.com/image.png ]]').content).to be_truthy
    end

    it 'strips wrapping double brackets' do
      expect(SourceCode.new(content: '[[ http://example.com/image.png ]]').content).to eq 'http://example.com/image.png'
    end

    it 'sets @url as readable' do
      expect(SourceCode.new(content: '[[ http://example.com/image.png ]]').url).to be_truthy
    end

    it 'extracts @url from content' do
      expect(SourceCode.new(content: '[[ http://example.com/image.png caption ]]').url).to eq 'http://example.com/image.png'
    end

    it 'sets @pieces as readable' do
      expect(SourceCode.new(content: '[[ http://example.com/image.png caption ]]').pieces).to be_truthy
    end

    xit 'must start with a URL' do
      expect(SourceCode.new(content: '[[ caption ]]')).to raise_error(TypeError)
    end
  end
end
