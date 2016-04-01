feature 'Play Uploaded Music' do

  before do
    Artist.create(email: 'artyartison@gmail.com', password: '12345678')
    visit 'http://localhost:9000/'
  end

  after(:each) do
    page.execute_script("window.localStorage.clear()")
  end

  scenario 'User uploads and displays uploaded track', js: true do
    artist_log_in('artyartison@gmail.com', '12345678')
    upload_track
    sleep(3)
    click_link('Home')
    find(:css, "img[id*='default track']").click
    expect(page).to have_content('default track')
    sleep(3)
  end
end
