feature 'displays song name' do

  after(:each) do
    page.execute_script("window.localStorage.clear()")
  end

  scenario  'displays song name in player', js: true do
    Artist.create(email: 'artyartison@gmail.com', password: '12345678')
    visit 'http://localhost:9000/'
    artist_log_in('artyartison@gmail.com', '12345678')
    upload_track('test song')
    sleep(3)
    click_link('Home')
    click_button('Play test song')
    expect(page).to have_css("#song-name", text: 'test song')
  end

end