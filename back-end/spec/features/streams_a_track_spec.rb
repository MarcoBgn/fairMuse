feature 'Tracks the number of plays a song has' do
  before do
    User.create(email: 'admin@gmail.com', password: '12345678')
    Track.create(id:1, name: "default song", artist_id:1, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
    Track.create(id:2, name: "default song2", artist_id:2, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))  
  end
    
  after(:each) do
    page.execute_script("window.localStorage.clear()")
  end

  scenario 'Logged in user can play a song thats already streamed', js: true do
    visit 'http://localhost:9000/'
    log_in
    click_button('Play default song')
    click_button('Play default song2')
    
    expect{click_button('Play default song')}.not_to change(Stream, :count)
  end

  scenario 'Logged in user plays a song for the first time', js: true do
    visit 'http://localhost:9000/'
    log_in
    click_button('Play default song')
    expect(Stream.count).to eq(1)
  end
end