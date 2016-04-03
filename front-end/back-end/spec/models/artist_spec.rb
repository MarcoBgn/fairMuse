require 'rails_helper'


RSpec.describe Artist, type: :model do
    let(:artist){described_class.new}

    it "generates an authentication token" do
      allow(artist).to receive(:email).and_return 'dave@gmail.com'
      allow(artist).to receive(:password).and_return 'password'
      allow(Devise).to receive(:friendly_token).and_return :token
      expect(artist.ensure_authentication_token).to eq "token"
    end
  end
