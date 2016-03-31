feature 'Tracks the number of plays a song has' do

  scenario 'Logged in user can play a song thats already streamed', js: true do
    visit 'http://localhost:9000/'
    Track.create(name: "Song1", genre: "Electro", artist_id: 1)
    log_in
    click_button('Play Yan-Yi\'s song')
    expect{click_button('Play Yan-Yi\'s song')}.not_to change(Stream, :count)
    find(:css, "#log_out").click
  end

  scenario 'Logged in user plays a song for the first time', js: true do
    Track.create(id:1, name: "Song1", genre: "Electro", artist_id: 1)
    visit 'http://localhost:9000/#/songs'
    log_in
    click_button('Play default song')
    expect(Stream.count).to eq(1)
  end
end