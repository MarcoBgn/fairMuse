require 'rails_helper'
RSpec.describe PaymentsController, type: :controller do
  before do
    artist = Artist.create(email:"test@email.com", password: 12345678)
    user = User.create(email: "test@email.com", password: 12345678)
    track = create_track_with_file
    @stream = Stream.create(track_id: track.id, user_id: user.id, total_plays: 1, weekly_plays: 1 )
  end
  let(:valid_attributes) {
    {user_id: 1}
  }
  describe "POST #pay" do
    context "with valid params" do
      it "deducts a payment from user" do
        post :pay, valid_attributes
        expect(User.last.balance).to eq(-100)
      end
      it "adds a payment to the artist"do
        post :pay, valid_attributes
        expect(Artist.last.balance).to eq(100)
      end
    end
  end
end
