feature 'Sign in' do
  before do
    User.create(email:'admin@gmail.com', password: '12345678')
  end
  
  after(:each) do
    page.execute_script("window.localStorage.clear()")
  end

  scenario "allows a user to sign in", js: true do
    visit 'http://localhost:9000/'
    click_link('Log in')
    fill_in 'email', with: 'admin@gmail.com'
    fill_in 'password', with: '12345678'
    click_button('Log in')
    expect(page).to have_content('Log out')
    find(:css, "#log_out").click
  end

  scenario 'allows a user to sign out', js: true do
    visit 'http://localhost:9000/'
    expect(page).to_not have_content('Log out')
  end

  scenario "doesn't allow a user to sign in without an account", js: true do
    visit 'http://localhost:9000/'
    click_link('Log in')
    fill_in 'email', with: 'noaccount@gmail.com'
    fill_in 'password', with: '12345678'
    click_button('Log in')
    expect(page).to_not have_content('Log out')
  end
  scenario "link to user account page is displayed when logged in", js: true do
    visit 'http://localhost:9000/'
    log_in
    click_link('Account')
    expect(page).to have_content('User Account')
    find(:css, "#log_out").click
  end
end
