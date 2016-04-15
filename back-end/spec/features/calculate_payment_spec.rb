feature 'payments for artists are calculated' do
  before do
    User.create(email: 'admin@gmail.com', password: '12345678')
    Artist.create(id:1, email: "name@email.com", password:"12345678", balance: 0)
    Artist.create(id:2, email: "name2@email.com", password:"12345678", balance: 0)
    Track.create(id:1, name: "default song", artist_id:1, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
    Track.create(id:2, name: "default song2", artist_id:1, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
    Track.create(id:3, name: "default song3", artist_id:2, file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
  end

  scenario 'does not have play count by default', js: true do
    visit 'http://localhost:9000/'
    log_in
    visit 'http://localhost:9000/'
    click_link('Account')
    click_button('Click')
    expect(page).not_to have_content('default song: 1')
    find(:css, "#log_out").click
  end

  scenario 'record is updated when user plays a song', js: true do
    visit 'http://localhost:9000/'
    log_in
    visit 'http://localhost:9000/'
    click_link('Home')
    find(:css, "#track_1").click
    click_link('Account')
    click_button('Click')
    expect(page).to have_content('default song: 1')
    find(:css, "#log_out").click
  end

  scenario 'play song when logged out does not change the play count', js: true do
    visit 'http://localhost:9000/'
    log_in
    visit 'http://localhost:9000/'
    find(:css, "#log_out").click
    click_link('Home')
    find(:css, "#track_1").click
    log_in
    visit 'http://localhost:9000/'
    click_link('Account')
    click_button('Click')
    expect(page).not_to have_content('default song: 1')
    find(:css, "#log_out").click
  end

  scenario 'artists can view their default balance of zero', js: true do
    visit 'http://localhost:9000/'
    artist_log_in
    click_link('Account')
    click_button('Click')
    expect(page).to have_content('Current Balance: 0')
    find(:css, "#log_out").click
  end

  scenario 'artists are paid in proportion to how many streams they had', js: true do
    visit 'http://localhost:9000'
    log_in
    visit 'http://localhost:9000/'
    find(:css, "#track_1").click
    find(:css, "#track_1").click
    find(:css, "#track_2").click
    find(:css, "#track_3").click
    click_link('Account')
    click_button('Pay')
    find(:css, "#log_out").click
    artist_log_in
    click_link('Account')
    click_button('Click')
    expect(page).to have_content('Current Balance: 75')
    find(:css, "#log_out").click
  end
end
