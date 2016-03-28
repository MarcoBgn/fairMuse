ENV['RAILS_ENV'] = 'development'

feature 'Tracks the number of plays a song has' do
  
  after(:each) do
  end
  
  scenario 'Logged in user plays a song already streamed', js: true do
    p "+++++++#{Stream.count}"
    User.create(email:'admin@gmail.com', password: '12345678')
    visit 'http://localhost:9000/'
    log_in
    expect{click_button('Play Yan-Yi\'s song')}.not_to change(Stream, :count)
    find(:css, "#log_out").click
  end
  
  scenario 'Logged in user plays a song for the first time', js: true do
      p "+++++++#{Stream.count}"
    User.create(email:'admin@gmail.com', password: '12345678')
    visit 'http://localhost:9000/'
    log_in
    expect{click_button('Play default song')}.to change(Stream, :count)
  end
end