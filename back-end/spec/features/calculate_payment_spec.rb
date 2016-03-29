feature 'payments for artists are calculated' do
  before do
    Track.create(id:1, name: "default song")
  end
  scenario 'does not have play count by default', js: true do
    visit 'http://localhost:9000/'
    log_in
    click_link('Account')
    click_button('Click')
    expect(page).not_to have_content('1: 1')
  end

  scenario 'record is updated when user plays a song', js: true do
    visit 'http://localhost:9000/'
    find(:css, "#log_out").click
    log_in
    click_link('Songs')
    click_button('Play default song')
    click_link('Account')
    click_button('Click')
    expect(page).to have_content('1: 1')
  end

  scenario 'play song when logged out does not change the play count', js: true do
    visit 'http://localhost:9000/'
    find(:css, "#log_out").click
    log_in
    find(:css, "#log_out").click
    click_link('Songs')
    click_button('Play default song')
    log_in
    click_link('Account')
    click_button('Click')
    expect(page).not_to have_content('1: 1')
  end

  scenario 'artists can view their balance', js: true do
    visit 'http://localhost:9000/'
    find(:css, "#log_out").click
    artist_log_in
    click_link('Account')
    click_button('Click')
    expect(page).to have_content('balance')
  end
end
