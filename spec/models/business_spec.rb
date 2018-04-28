require 'rails_helper'

RSpec.describe Business, type: :model do
  let(:business) {
    Business.create(
      :name => "Tees and Things",
    )
  }

it "is valid with a name" do
   expect(business).to be_valid
 end

end
