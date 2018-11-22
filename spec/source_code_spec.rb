require 'spec_helper'

RSpec.describe SourceCode do
  describe '#initialize' do
    simple_embed              = SourceCode.new(content: '[[ http://example.com/image.png ]]')
    simple_embed_with_caption = SourceCode.new(content: '[[ http://example.com/image.png lorem ipsum caption ]]')
    simple_embed_with_id      = SourceCode.new(content: '[[ http://example.com/image.png id:test ]]')
    simple_embed_with_class   = SourceCode.new(content: '[[ http://example.com/image.png class:test ]]')
    simple_embed_with_type    = SourceCode.new(content: '[[ http://example.com/image.png type:video ]]')
    simple_embed_with_link    = SourceCode.new(content: '[[ http://example.com/image.png http://example.org ]]')

    context '#content' do
      it 'requires a content parameter' do
        expect { SourceCode.new }.to raise_error(ArgumentError)
      end

      it 'is valid with required content parameter' do
        expect { simple_embed }.to_not raise_error
      end

      it 'sets @content as readable' do
        expect(simple_embed.content).to be_truthy
      end
    end

    context 'strips brackets' do
      it 'strips wrapping double brackets' do
        expect(simple_embed.content).to eq 'http://example.com/image.png'
      end
    end

    context '#pieces' do
      it 'sets @pieces as readable' do
        expect(simple_embed_with_caption.pieces).to be_truthy
      end
    end

    context 'with URL' do
      it 'sets @url as readable' do
        expect(simple_embed.url).to be_truthy
      end

      it 'extracts @url from content' do
        expect(simple_embed_with_caption.url).to eq 'http://example.com/image.png'
      end

      xit 'must start with a URL' do
        expect(SourceCode.new(content: '[[ lorem ipsum caption ]]')).to raise_error(TypeError)
      end
    end

    context 'with id' do
      it 'sets @id as readable' do
        expect(simple_embed_with_id.id).to be_truthy
      end
    end

    context 'with class' do
      it 'sets @klass as readable' do
        expect(simple_embed_with_class.klass).to be_truthy
      end
    end

    context 'with type' do
      it 'sets @type as readable' do
        expect(simple_embed_with_type.type).to be_truthy
      end
    end

    context 'with link' do
      it 'sets @link as readable' do
        expect(simple_embed_with_link.link).to be_truthy
      end
    end
  end
end
