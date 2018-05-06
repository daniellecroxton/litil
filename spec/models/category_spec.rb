require 'rails_helper'

RSpec.describe Category, :type => :model do
  before do
    @category = Category.first
    @category.businesses << Business.first
  end

  it "is valid with a name" do
    expect(@category).to be_valid
  end

  it "is not valid without a name" do
    expect(Category.new(name: nil)).not_to be_valid
  end

  it 'has many businesses' do
    expect(@category.businesses).to include(Bustiness.first)
  end
end
