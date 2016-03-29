ENV['RAILS_ENV']='development'

feature 'Tracks the number of plays a song has' do

  scenario 'Logged in user plays a song already streamed', js: true do
    visit 'http://localhost:9000/'
    log_in
    expect{click_button('Play Yan-Yi\'s song')}.not_to change(Stream, :count)
    find(:css, "#log_out").click
    sleep(2)
  end

  scenario 'Logged in user plays a song for the first time', js: true do
    visit 'http://localhost:9000/#/songs'
    click_button('Play default song')
    expect(Stream.count).to eq(1)
  end

end