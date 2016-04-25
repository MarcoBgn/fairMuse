feature 'Tracks the number of plays a song has' do
  before do
    listener = User.create(email: 'admin@gmail.com', password: '12345678')
    role = listener.create_role
    artist_1 = User.create(id:2, email: "artist@email.com", password:"12345678")
    artist_1.create_role(artist: true)
    artist_2 = User.create(id:3, email: "artist2@email.com", password:"12345678")
    artist_2.create_role(artist: true)
    Track.create(id:1, name: "default song", artist_id:2, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
    Track.create(id:2, name: "default song2", artist_id:3, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
  end

  after(:each) do
    page.execute_script("window.localStorage.clear()")
  end

  scenario 'Logged in user can play a song thats already streamed', js: true do
    visit 'http://localhost:9000/'
    log_in
    visit 'http://localhost:9000/'
    find(:css, "#track_1").click
    find(:css, "#track_2").click

    expect{find(:css, "#track_1").click}.not_to change(Stream, :count)
  end

  scenario 'Logged in user plays a song for the first time', js: true do
    visit 'http://localhost:9000/'
    log_in
    visit 'http://localhost:9000/'
    find(:css, "#track_1").click
    expect(Stream.count).to eq(1)
  end
end
