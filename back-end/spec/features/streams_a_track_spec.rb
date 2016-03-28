feature 'Tracks the number of plays a song has' do
  
#defering feature tests until after implemnetation of user story 10: play uploaded music.

  scenario 'Logged in user plays a song already streamed', js: true do
    Stream.find_by(track_id: 1).destroy!
    visit 'http://localhost:9000/'
    log_in
    expect{click_button('Play Yan-Yi\'s song')}.not_to change(Stream, :count)
    find(:css, "#log_out").click
    sleep(2)
  end
  
  scenario 'Logged in user plays a song for the first time', js: true do    
    visit 'http://localhost:9000/#/songs'
    click_button('Play default song')
    expect(Stream.count).to eq(2)
  end
end