require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let!(:user){user = FactoryGirl.create(:user)}
  let!(:stream){stream = FactoryGirl.create(:stream)}

  it "is added when user adds somethign as a favorite" do
    favorite = Favorite.create user_id:user.id, stream_id:stream.id
    expect(favorite).to be_valid
    expect(Favorite.count).to eq(1)
  end
end
