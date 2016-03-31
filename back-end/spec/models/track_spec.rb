require 'rails_helper'

RSpec.describe Track, type: :model do

  before do
    @track = create_track_with_file
  end

  context "Validations for file:" do

    it { is_expected.to have_attached_file(:file) }
    it { is_expected.to validate_attachment_presence(:file) }
    it { is_expected.to validate_attachment_content_type(:file).
        allowing('audio/mpeg').
        rejecting('text/plain', 'image/jpg') }
    it { is_expected.to validate_attachment_size(:file).
        in(0..10.megabytes) }
  end

  context "Validations for image:" do

    it { is_expected.to have_attached_file(:image) }
    it { is_expected.to validate_attachment_content_type(:image).
        allowing('image/*').
        rejecting('text/plain', 'audio/*') } 
    it { is_expected.to validate_attachment_size(:image).
       in(0..4.megabytes) }
  end

  context "Model:" do

    it { is_expected.to have_many :streams }
    it 'has a name' do 
      expect(@track.name).to eq "default"
    end

    it 'has a genre' do
      expect(@track.genre).to eq "Electro"
    end
  end
end