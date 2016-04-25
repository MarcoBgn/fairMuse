require 'rails_helper'
RSpec.describe ArtistsController, type: :controller do
  before do
    User.create(email:"test@email.com", password: 12345678, password_confirmation: 12345678, balance: 100)
  end
  let(:valid_attributes){
    {artist_id: 1}
  }
  describe "POST #get_balance"do
    context "with valid params"do
      it "returns the artists balance"do
        expected = {balance: "100.0"}.to_json
        post :get_balance, valid_attributes
        response.body.should == expected
      end
    end
  end
end
