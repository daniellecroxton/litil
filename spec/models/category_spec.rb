require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) { Category.create(:name => "Clothing & Accessories") }

  let(:business) {
    Business.create(
      :name => "Spirit Friends"
    )
  }

  it "is valid with a name" do
    expect(category).to be_valid
  end

  it "is not valid without a name" do
    expect(Category.new(name: nil)).not_to be_valid
  end

  it 'has many businesses' do
    category.businesses << business
    expect(category.businesses).to include(business)
  end
end
