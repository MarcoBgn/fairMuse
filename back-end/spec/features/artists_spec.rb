feature 'artists can sign up' do

  scenario 'there is a artist sign-up page', js: true do
    visit 'http://localhost:9000/'
    click_link('Artists')
    expect(current_url).to eq('http://localhost:9000/#/artist')
  end
  scenario 'an artist can sign up', js: true do
    visit 'http://localhost:9000/'
    click_link('Artists')
    expect(current_url).to eq('http://localhost:9000/#/artist')
    fill_in 'email', with: 'email@gmail.com'
    fill_in 'password', with: '12345678'
    fill_in 'password_confirmation', with: '12345678'
    click_button('Sign up')
    expect(page).to have_content('Log out')
  end

end
