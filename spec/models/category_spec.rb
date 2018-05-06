require 'rails_helper'

RSpec.describe Category, :type => :model do
  before do
    @category = Category.first
    @category.businesses << Business.first
  end

  it 'has many businesses' do
    expect(@category.businesses).to include(Bustiness.first)
  end
end
