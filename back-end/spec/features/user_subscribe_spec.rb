feature 'User subscribes during sign up', js: true do
  scenario 'signing up' do
    visit'http://localhost:9000/'
    click_link('Sign up')
    fill_in 'email', with: 'randy@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    click_button('Sign up')
    click_button('Subscribe')
    sleep(3)
    contribute_with_card
    sleep(3)
    expect(page).to have_content "Contribution Made! Thank You!"
  end
end
