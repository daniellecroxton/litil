require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let(:tag) { Tag.create(:name => "embroidered") }

  let(:product) { Product.create(:name => "Patch") }

  it "is valid with a name" do
    expect(tag).to be_valid
  end

  it "is not valid without a name" do
    expect(Tag.new(name: nil)).not_to be_valid
  end

  it 'has many products' do
    tag.products << product
    expect(tag.products).to include(product)
  end
end
