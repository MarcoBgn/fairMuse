feature 'Sign up' do
  after(:all) do
 puts User.all.count
 DatabaseCleaner.clean
 puts User.all.count
  end
  scenario 'allows a user to sign up', js: true do
    visit 'http://localhost:9000/'
    click_link('Sign up')
    fill_in 'email', with: 'email@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    click_button('Sign up')
    expect(page).to have_content('Log out')
  end

  scenario 'does not allow a user to sign up with same email twice', js: true do
    visit 'http://localhost:9000/'
    find(:css, "#log_out").click
    click_link('Sign up')
    fill_in 'email', with: 'admin@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    click_button('Sign up')
    expect(page).to have_content('Email has already been taken!')
  end
end
