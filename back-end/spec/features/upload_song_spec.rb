feature 'Upload Songs' do
  
  scenario 'User can Upload a song', js: true do
    visit 'http://localhost:9000/#/account'
    upload_track
    expect(page).to have_content "Upload Successful"
  end
end