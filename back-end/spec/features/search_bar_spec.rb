feature 'Search Bar' do
  scenario 'User can search for track title', js: true do
    create_track_with_file(name="Default")
    visit 'http://localhost:9000/#/songs'
    fill_in "search_bar", with: "Default"
    expect(page).to have_content "Default" 
  end
  
  scenario 'User cannot find non existent track', js: true do
    visit 'http://localhost:9000/#/songs'
    fill_in "search_bar", with: "wrongsearch"
    expect(page).not_to have_content "default" 
  end
end