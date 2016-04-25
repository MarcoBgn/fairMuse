def log_in(email='admin@gmail.com', password='12345678')
  click_link('Listener')
  sleep(2)
  find(:css, ".signintab").click
  sleep(2)
  fill_in 'email', with: email
  fill_in 'password', with: password
  sleep(2)
  click_button('Log in')
  sleep(2)
end

def artist_log_in(email = 'artist@email.com', password = '12345678')
  click_link('Artist')
  sleep(2)
  find(:css, ".signintab").click
  sleep(2)
  fill_in 'email', with: email
  fill_in 'password', with: password
  sleep(2)
  click_button('Log in')
  sleep(1)
end
