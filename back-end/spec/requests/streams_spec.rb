require 'rails_helper'

RSpec.describe "Streams", type: :request do
  
  before do
    User.create(id: 1, email: 'admin2@gmail.com', password: '12345678')
    Track.create(id:1, name: "song1", artist_id:1, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
    Track.create(id:2, name: "song2", artist_id:1, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
    @stream = [{track_id: "song1", total_plays: 1}].to_json
  end
  
  describe "GET /api/streaminfo" do
    it "responds with 200" do
      post api_streaminfo_path
      expect(response).to have_http_status(200)
    end
  end
end