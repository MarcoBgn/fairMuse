feature 'Upload Songs' do
  scenario 'User can Upload a song', js: true do
    visit 'http://localhost:9000/#/account'
    fill_in "trackname", with: "Great Track"
    select "Pop", from: "genre"
    attach_file 'file', Rails.root.join('spec','audio','testsong.mp3')
    click_button "Upload"
    expect(page).to have_content "Upload Successful"
  end
end