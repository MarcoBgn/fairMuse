require 'rails_helper'
RSpec.describe PaymentsController, type: :controller do
  before do
    artist = User.create(email:"artist@email.com", password: 12345678)
    user = User.create(email: "user@email.com", password: 12345678)
    track = create_track_with_file
    @stream = Stream.create(track_id: track.id, user_id: user.id, total_plays: 1, weekly_plays: 1 )
  end
  let(:valid_attributes) {
    {user_id: 2}
  }
  describe "POST #pay" do
    context "with valid params" do
      it "deducts a payment from user" do
        post :pay, valid_attributes
        expect(User.last.balance).to eq(-100)
      end
      it "adds a payment to the artist"do
        post :pay, valid_attributes
        expect(User.first.balance).to eq(100)
      end
    end
  end
end
