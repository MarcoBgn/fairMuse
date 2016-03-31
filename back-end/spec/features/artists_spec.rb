feature 'artists can sign up' do

  scenario 'there is a artist sign-up page', js: true do
    visit 'http://localhost:9000/'
    click_link('Artists Sign Up')
    expect(current_url).to eq('http://localhost:9000/#/artistsignup')
  end
  scenario 'an artist can sign up', js: true do
    visit 'http://localhost:9000/'
    click_link('Artists Sign Up')
    expect(current_url).to eq('http://localhost:9000/#/artistsignup')
    fill_in 'email', with: 'email@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    click_button('Sign up')
    expect(page).to have_content('Log out')
    find(:css, "#artist_log_out").click
  end

  scenario 'does not allow an artist to sign up with same email twice', js: true do
    visit 'http://localhost:9000/'
    Artist.create(email: 'artyartison@gmail.com', password: '12345678')
    click_link('Artists Sign Up')
    fill_in 'email', with: 'artyartison@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    click_button('Sign up')
    sleep(2)
    expect(page).to have_content('Sign up failed!')
  end

  scenario "an artist can sign in", js: true do
    visit 'http://localhost:9000/'
    click_link('Artist Sign In')
    Artist.create(email: 'artyartison@gmail.com', password: '12345678')
    fill_in 'email', with: 'artyartison@gmail.com'
    fill_in 'password', with: '12345678'
    click_button('Log in')
    expect(page).to have_content('Log out')
    find(:css, "#artist_log_out").click
  end

  scenario "a link to artist account is displayed after signing in", js: true do
    visit 'http://localhost:9000/'
    Artist.create(email: "name@email.com", password: "12345678")
    artist_log_in
    click_link("Account")
    expect(page).to have_content("Artist Account")
    find(:css, "#artist_log_out").click
  end

  scenario 'an artist can sign out', js: true do
    visit 'http://localhost:9000/'
    Artist.create(email: "name@email.com", password: "12345678")
    artist_log_in
    find(:css, "#artist_log_out").click
    expect(page).to_not have_content('Log out')
  end

  scenario "an artist cannot sign in without an account", js: true do
    visit 'http://localhost:9000/'
    click_link('Artist Sign In')
    fill_in 'email', with: 'noaccount@gmail.com'
    fill_in 'password', with: '12345678'
    click_button('Log in')
    expect(page).to_not have_content('Log out')
  end

end
