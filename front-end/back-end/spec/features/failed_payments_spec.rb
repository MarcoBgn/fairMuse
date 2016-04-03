feature 'the payment is not successful' do

  scenario 'card is declined', js: true do
    visit 'http://localhost:9000/'
    click_link 'About'
    fill_in "amount", with: 50
    click_button 'Pay with Card'
    if page.has_content?('OK') == true
      click_button('OK')
      contribute_with_incorrect_card
    else
      contribute_with_incorrect_card
    end
  end
end
