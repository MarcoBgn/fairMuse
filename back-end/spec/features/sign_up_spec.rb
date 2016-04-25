feature 'Sign up' do

  scenario 'allows a listener to sign up', js: true do
    visit 'http://localhost:9000/'
    click_link('Listeners')
    find(:css, ".signuptab").click
    fill_in 'email', with: 'email@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    click_button('Sign up')
    expect(page).to have_content('Log out')
    visit 'http://localhost:9000/'
    find(:css, "#log_out").click
  end

  scenario 'does not allow a user to sign up with same email twice', js: true do
    user = User.create(email:'admin@gmail.com', password: '12345678')
    user.create_role
    visit 'http://localhost:9000/'
    click_link('Listeners')
    find(:css, ".signuptab").click
    fill_in 'email', with: 'admin@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    click_button('Sign up')
    expect(page).to have_content('Email has already been taken')
  end
end
