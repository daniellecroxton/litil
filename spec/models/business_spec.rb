require 'rails_helper'

RSpec.describe Business, type: :model do
  before(:each) do
    @user = User.first
    @category = Category.first
  end

  let(:business) {
    Business.create(
      :name => "Tees and Things",
      :user_id => @user.id,
      :category_id => @category.id
    )
  }

it "is valid with a name" do
   expect(business).to be_valid
 end

end
