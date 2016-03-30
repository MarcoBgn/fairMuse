feature 'Play Uploaded Music' do
	scenario 'User uploads and plays uploaded track', js: true do
		visit 'http://localhost:9000/#/account'
		upload_track
		sleep(4)
		click_button('1')
		expect(page).to have_css("#song-name", text: "default track")
	end

end