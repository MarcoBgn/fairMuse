feature 'Tracks the number of plays a song has' do
  
  scenario 'Logged in user plays a song', js: true do
    visit 'http://localhost:9000/'
    log_in
    expect{click_button('Play Yan-Yi\'s song')}.to change(Stream, :count).by(1)
  end
end