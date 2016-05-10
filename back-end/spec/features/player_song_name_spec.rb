feature 'displays song name' do

  after(:each) do
    page.execute_script("window.localStorage.clear()")
  end

  scenario  'displays song name in player', js: true do
    artist = User.create(email: 'artyartison@gmail.com', password: '12345678')
    artist.create_role(artist: true)
    visit 'http://localhost:9000/'
    artist_log_in('artyartison@gmail.com', '12345678')
    upload_track('test song')
    sleep(3)
    visit 'http://localhost:9000/'
    find(:css, "#track_1").click
    expect(page).to have_css("#song-name", text: 'test song')
  end

end
