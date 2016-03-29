def log_in(email='admin@gmail.com', password='12345678')
  User.create(id: 1000, email: "hello@gmail.com", password: "12345678")
  User.create(email: email, password: password)
  click_link('Log in')
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button('Log in')
end

def artist_log_in(email='admin@gmail.com', password='12345678')
  Artist.create(email: email, password: password)
  click_link('Artist Sign In')
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button('Log in')
end