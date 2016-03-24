def contribute_with_card
  stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  Capybara.within_frame stripe_iframe do
    page.execute_script(%Q{ $( 'input#email').val('y@ymail.com'); })
    page.execute_script(%Q{ $( 'input#card_number').val('4242 4242 4242 4242'); })
    page.execute_script(%Q{ $( 'input#cc-exp').val('01/19'); })
    page.execute_script(%Q{ $( 'input#cc-csc').val('111'); })
    page.execute_script(%Q{ $( '#submitButton').click(); })
  end
end

def contribute_with_incorrect_card
  stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  Capybara.within_frame stripe_iframe do
    page.execute_script(%Q{ $( 'input#email').val('y@ymail.com'); })
    page.execute_script(%Q{ $( 'input#card_number').val('4000 0000 0000 0002'); })
    page.execute_script(%Q{ $( 'input#cc-exp').val('01/19'); })
    page.execute_script(%Q{ $( 'input#cc-csc').val('111'); })
    page.execute_script(%Q{ $( '#submitButton').click(); })
    sleep(2)
    expect(page).to have_content "This card was declined."
  end
end