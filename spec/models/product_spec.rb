require 'rails_helper'

RSpec.describe Product, :type => :model do
  let(:tag) { Tag.create(:name => "embroidered") }

  let(:business) {
    Business.create(
      :name => "Spirit Friends",
      :latitude => 40.769,
      :longitude => 111.889,
      :full_street_address => "60 E. South Temple, Salt Lake City, UT 84111",
      :website => "www.spiritfriends.com",
      :phone => "555-555-5555",
      :rating => 5
    )
  }

  let(:product) { Product.create(:name => "Deer Patch") }

  let(:user) { User.first }


  it "is valid with a name" do
    expect(product).to be_valid
  end

  it "is not valid without a name" do
    expect(Product.new(name: nil)).not_to be_valid
  end

  it 'has many tags' do
    product.tags << tag
    expect(product.tags).to include(tag)
  end

  it 'has many businesses' do
    product.businesses << business
    expect(product.businesses).to include(business)
  end

  #image

end
