require 'rails_helper'


RSpec.describe StreamsController, type: :controller do
  before do
    User.create(id: 0, email: 'admin@gmail.com', password: '12345678')
    User.create(id: 1, email: 'admin2@gmail.com', password: '12345678')
    Track.create(id:1, name: "song1", artist_id:1, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
    Track.create(id:2, name: "song2", artist_id:1, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
    create_stream
  end
  let(:valid_attributes) {
    {track_id: 1,
     user_id: 1,
     total_plays: 1,
     weekly_plays: 1}
  }
  
  let(:invalid_attributes) {
    {user_id: 1,
     total_plays: 1}
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Stream" do
        expect {
          post :create, {stream: valid_attributes}, valid_session
        }.to change(Stream, :count).by(1)
      end
    end
  end
end
