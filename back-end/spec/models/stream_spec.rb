require 'rails_helper'

RSpec.describe Stream, type: :model do

  before do
    artist = User.create(email:"test@email.com", password: 12345678)
    artist.create_role(artist: true)
    user = User.create(email: "test2@email.com", password: 12345678)
    user.create_role
    track = create_track_with_file
    @stream = Stream.create(track_id: track.id, user_id: user.id, total_plays: 1, weekly_plays: 1 )
  end

  it { is_expected.to belong_to :track }
  it { is_expected.to belong_to :user }

  it 'has a total plays column' do
    expect(@stream.total_plays).to eq 1
  end

  it 'has a weekly plays column' do
    expect(@stream.weekly_plays).to eq 1
  end

  it 'pays the artist for the number of streams'do
    Stream.weekly_usage(Stream.where(user_id: 2))
    artist = User.find(1)
    expect(artist.balance).to eq 100
  end
end
