feature 'payments for artists are calculated' do
  scenario 'record is updated when user plays a song'do
    visit 'http://localhost:9000/'
    log_in
    click_link('Songs')
    click_button('Play default song')
    click_link('Account')
    expect(page).to have_content('default song: 1')
  end


end
