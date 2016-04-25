feature 'artists can sign up' do
  before do
    user = User.create(email:'artist@email.com', password:'12345678')
    user.create_role(artist: true)
  end
  # after(:each) do
  #   page.execute_script("window.localStorage.clear()")
  # end

  scenario 'there is a sign-up page', js: true do
    visit 'http://localhost:9000/'
    click_link('Artists')
    expect(current_url).to eq('http://localhost:9000/#/artist')
  end

  scenario 'an artist can sign up', js: true do
    visit 'http://localhost:9000/'
    click_link('Artists')
    find(:css, ".signuptab").click
    fill_in 'email', with: 'email@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    sleep(2)
    find(:css, ".accountbutton").click
    sleep(2)
    expect(page).to have_content('Log out')
    find(:css, "#log_out").click
  end

  scenario 'does not allow an artist to sign up with same email twice', js: true do
    visit 'http://localhost:9000/'
    click_link('Artist')
    sleep(2)
    find(:css, ".signuptab").click
    sleep(2)
    fill_in 'email', with: 'artist@email.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    sleep(2)
    find(:css, ".accountbutton").click
    sleep(2)
    expect(page).to have_content('Email has already been taken')
  end

  scenario "an artist can sign in", js: true do
    visit 'http://localhost:9000/'
    click_link('Artist')
    sleep(2)
    fill_in 'email', with: 'artist@email.com'
    fill_in 'password', with: '12345678'
    sleep(2)
    find(:css, ".accountbutton").click
    sleep(2)
    expect(page).to have_content('Log out')
    find(:css, "#log_out").click
  end

  scenario "a link to artist account is displayed after signing in", js: true do
    visit 'http://localhost:9000/'
    artist_log_in
    click_link("Account")
    expect(page).to have_content("Artist Account")
    find(:css, "#log_out").click
  end

  scenario 'an artist can sign out', js: true do
    visit 'http://localhost:9000/'
    artist_log_in
    find(:css, "#log_out").click
    expect(page).to_not have_content('Log out')
  end

  scenario "an artist cannot sign in without an account", js: true do
    visit 'http://localhost:9000/'
    click_link('Artist')
    fill_in 'email', with: 'noaccount@gmail.com'
    fill_in 'password', with: '12345678'
    click_button('Log in')
    expect(page).to_not have_content('Log out')
    expect(page).to have_content('Sign In Failed')
  end

end
