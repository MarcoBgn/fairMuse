require 'rails_helper'

RSpec.describe Track, type: :model do
  before do

    @track = Track.create(name: "Song1", genre: "Electro", file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
  end

  
  
    it { is_expected.to have_attached_file(:file) }
    it { is_expected.to validate_attachment_presence(:file) }
    it { is_expected.to validate_attachment_content_type(:file).
                  allowing('audio/mpeg').
                  rejecting('text/plain', 'image/jpg') }
    it { is_expected.to validate_attachment_size(:file).
                  in(0..9437184.bytes) }
  
  it 'has a name' do
    expect(@track.name).to eq "Song1"
  end

  it 'has a genre' do
    expect(@track.genre).to eq "Electro"
  end
end
