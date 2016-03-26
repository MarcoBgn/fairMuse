feature 'Upload Songs' do
  
  scenario 'User can Upload a song', js: true do
    allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(:true)
    visit 'http://localhost:9000/#/account'
    fill_in "trackname", with: "Great Track"
    fill_in "genre", with: "Alternative"
    attach_file 'file', Rails.root.join('spec','fixtures','testsong.mp3')
    click_button "Upload"
    expect(page).to have_content "Upload Successful"
  end
end