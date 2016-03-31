require 'rails_helper'

RSpec.describe "Tracks", type: :request do
  
  before do
    @track = [create_track_with_file].to_json(methods: [:track_url, :image_url])
  end
  
  describe "GET /tracks" do
    it "responds with 200" do
      get tracks_path
      expect(response).to have_http_status(200)
    end
    
    it "responds with json" do
      get tracks_path
      expect(response.body).to eq @track
    end
  end
end