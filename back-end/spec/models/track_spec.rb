require 'rails_helper'

RSpec.describe Track, type: :model do
  before do
     @track = Track.create(name: "Song1", url: "http://test.com", genre: "Electro")
  end
  it 'has a name' do
    expect(@track.name).to eq "Song1"
  end

  it 'has a url' do
    expect(@track.url).to eq "http://test.com"
  end

  it 'has a genre' do
    expect(@track.genre).to eq "Electro"
  end
end
