require 'rails_helper'

RSpec.describe Business, :type => :model do
  let(:new_category) { Category.create(:name => "Clothing & Accessories", :id => 609) }

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


  it "is valid with a name, latitude, longitude, full_street_address, website, phone, and rating" do
    expect(business).to be_valid
  end

  it "is not valid without a name" do
    expect(Business.new(name: nil)).not_to be_valid
  end

  it 'has many products' do
    business.products << product
    expect(business.products).to include(product)
  end

  it "belongs to one category" do
    business.category = category
    expect(business.category).to eq(category)
  end

  it "belongs to one user" do
    business.user = user
    expect(business.user).to eq(user)
  end

  #scope most recent
  describe ".recent" do
    it "returns 3 most recently created businesses" do
      expect(Business.recent.count).to eq(3)
      expect(Business.recent).to include Business.last(3)
    end
  end


  #class method .by_category
  describe ".by_category" do
    before(:each) do
      business.category = new_category
    end
    it "only returns businesses that belong to the provided category id" do
      expect(Business.by_category(609)).to include("Spirit Friends")
      expect(Business.by_category(610)).to_not include("Spirit Friends")
    end
  end
end
