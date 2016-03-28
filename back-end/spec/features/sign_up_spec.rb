feature 'Sign up' do
  scenario 'allows a user to sign up', js: true do
    visit 'http://localhost:9000/'
    click_link('Sign up')
    fill_in 'email', with: 'email@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    click_button('Sign up')
    expect(page).to have_content('Log out')
  end
end
