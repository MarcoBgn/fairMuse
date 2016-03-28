feature 'Sign in' do
  scenario "allows a user to sign in", js: true do
    visit 'http://localhost:9000/'
    click_link('Log in')
    fill_in 'email', with: 'admin@gmail.com'
    fill_in 'password', with: '12345678'
    click_button('Log in')
    expect(page).to have_content('Log out')
  end

  scenario 'allows a user to sign out', js: true do
    visit 'http://localhost:9000/'
    find(:css, "#log_out").click
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
end