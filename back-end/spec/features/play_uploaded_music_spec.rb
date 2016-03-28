feature 'Play Uploaded Music' do

	scenario 'User uploads and plays uploaded track', js: true do
		visit 'http://localhost:9000/#/account'
		upload_track
		expect(page).to have_content("Song1")
	end

end