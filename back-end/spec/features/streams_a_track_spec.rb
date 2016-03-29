feature 'Tracks the number of plays a song has' do

#defering feature tests until after implemnetation of user story 10: play uploaded music.

  scenario 'Logged in user plays a song already streamed', js: true do
    Track.create(name: "Song1", genre: "Electro")
    visit 'http://localhost:9000/#/songs'
    click_button('Play Yan-Yi\'s song')
    expect{click_button('Play Yan-Yi\'s song')}.not_to change(Stream, :count)
  end

  scenario 'Logged in user plays a song for the first time', js: true do
    Track.create(name: "Song1", genre: "Electro")
    visit 'http://localhost:9000/#/songs'
    click_button('Play default song')
    expect(Stream.count).to eq(1)
  end
end
