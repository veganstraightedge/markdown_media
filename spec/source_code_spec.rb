require "spec_helper"

RSpec.describe SourceCode do
  describe "#initialize" do
    it 'requires a content parameter' do
      expect { SourceCode.new }.to raise_error(ArgumentError)
    end

    it 'is valid with required content parameter' do
      expect { SourceCode.new(content: '[[ test ]]') }.to_not raise_error
    end

    it 'sets @content as readable' do
      expect(SourceCode.new(content: '[[ test ]]').content).to be_truthy
    end

    it 'strips wrapping double brackets' do
      expect(SourceCode.new(content: '[[ test ]]').content).to eq 'test'
    end
  end
end
