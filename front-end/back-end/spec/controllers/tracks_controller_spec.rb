require 'rails_helper'


RSpec.describe TracksController, type: :controller do
  before do
    create_track_with_file
    create_track_with_file_and_image
  end
  let(:valid_attributes) {
    {name: "Test",
     genre: "Rock",
     file: fixture_file_upload("testsong.mp3", 'audio/mpeg'),
     artist: "Artist"}
  }
  
  let(:valid_attributes_with_image) {
    {name: "Test", genre: "Rock",
     file: fixture_file_upload("testsong.mp3", 'audio/mpeg'),
     image: fixture_file_upload("testimage.png", 'image/png'),
     artist: "Artist"}
  }
  
  let(:invalid_attributes) {
    {name: "Test",
     genre: "Rock",
     file: fixture_file_upload("testsong.mp3", 'image/jpg')}
  }
  
  let(:invalid_attributes_with_image) {
    {name: "Test",
     genre: "Rock",
     file: fixture_file_upload("testsong.mp3", 'image/jpg'),
     image: fixture_file_upload("testimage.png", 'text/txt')}
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Track" do
        expect {
          post :create, {track: valid_attributes}, valid_session
        }.to change(Track, :count).by(1)
      end
      
      it "creates a new Track with Image" do
        expect {
          post :create, {track: valid_attributes_with_image}, valid_session
        }.to change(Track, :count).by(1)
      end
    end

    context "with invalid params" do
      it "does not create a new Track" do
        expect {
          post :create, {track: invalid_attributes}, valid_session
        }.to change(Track, :count).by(0)
      end
      
      it "does not create a new Track with invalid image type" do
        expect {
          post :create, {track: invalid_attributes_with_image}, valid_session
        }.to change(Track, :count).by(0)
      end
    end
  end
end
