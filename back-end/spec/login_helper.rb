def log_in(email='admin@gmail.com', password='12345678')
  click_link('Log in')
  find(:css, "#user_tab").click
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button('Log in')
end

def artist_log_in(email='name@email.com', password='12345678')
  click_link('Log in')
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button('Log in')
end
