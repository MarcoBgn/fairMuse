feature 'payments for artists are calculated' do
  scenario 'does not have play count by default', js: true do
    visit 'http://localhost:9000/'
    log_in
    click_link('Account')
    expect(page).not_to have_content('default song: 1')
  end

  scenario 'record is updated when user plays a song', js: true do
    visit 'http://localhost:9000/'
    log_in
    click_link('Songs')
    click_button('Play default song')
    click_link('Account')
    expect(page).to have_content('default song: 1')
  end

  scenario 'play song when logged out does not change the play count', js: true do
    visit 'http://localhost:9000/'
    click_link('Songs')
    click_button('Play default song')
    log_in
    click_link('Account')
    expect(page).not_to have_content('default song: 1')
  end
end
