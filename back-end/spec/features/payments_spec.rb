feature 'Contribution payments' do

  scenario 'the payment is successful', js: true do
    visit 'http://localhost:9000/'
    sleep(3)
    click_link 'About'
    fill_in "amount", with: 50
    click_button 'Pay with Card'
    if page.has_content?('OK') == true
       click_button('OK')
       contribute_with_card
       sleep(7)
    else
       contribute_with_card
       sleep(7)
    end
     expect(page).to have_content "Contribution Made! Thank You!"
  end
end