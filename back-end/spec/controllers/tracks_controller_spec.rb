require 'rails_helper'


RSpec.describe TracksController, type: :controller do
  before do
    @track = Track.new
  end
  let(:valid_attributes) {
    {name: "Test", genre: "Rock", file: fixture_file_upload("testsong.mp3", 'audio/mpeg'), artist: "Artist"}
  }

  let(:invalid_attributes) {
    {name: "Test", genre: "Rock", file: fixture_file_upload("testsong.mp3", 'image/jpg')}
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Track" do
        expect {
          post :create, {track: valid_attributes}, valid_session
        }.to change(Track, :count).by(1)
      end
    end

    context "with invalid params" do
      it "does not create a new Track" do
        expect {
          post :create, {track: invalid_attributes}, valid_session
        }.to change(Track, :count).by(0)
      end
    end
  end
end
