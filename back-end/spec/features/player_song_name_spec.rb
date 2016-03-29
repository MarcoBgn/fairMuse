feature 'Song name in player' do
  scenario  'displays song name in player', js: true do
    visit 'http://localhost:9000/'
    click_link('Songs')
    click_button('Play default song')
    expect(page).to have_css("#song-name", text: "default song")
  end
end