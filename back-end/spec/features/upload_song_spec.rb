feature 'Upload Songs' do

  before do
    user = User.create(id:1, email: "artist@email.com", password:"12345678", balance: 0)
    user.create_role(artist: true)
  end

  after(:each) do
    page.execute_script("window.localStorage.clear()")
  end

  scenario 'User can Upload a song', js: true do
    visit 'http://localhost:9000/'
    artist_log_in
    upload_track
    visit('http://localhost:9000/')
    expect(page).to have_content "default track"
  end
end
