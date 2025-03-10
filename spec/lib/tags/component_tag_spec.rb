require "rails_helper"

RSpec.describe Lookbook::ComponentTag do
  it "extends Lookbook::YardTag" do
    expect(described_class).to be < Lookbook::YardTag
  end

  context ".value" do
    it "returns the constantized component class" do
      tag = described_class.new("InlineComponent")
      expect(tag.value).to eq ::InlineComponent
    end

    it "raises an exception if the component doesn't exit" do
      tag = described_class.new("DoesntExistComponent")

      expect { tag.value }.to raise_error NameError
    end

    it "returns nil if no component is specified" do
      tag = described_class.new

      expect(tag.value).to be nil
    end
  end
end
