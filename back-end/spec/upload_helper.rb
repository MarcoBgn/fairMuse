def create_track_with_file
	Track.create(name: "Song1", genre: "Electro", file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
end

def upload_track(name="default track")
	fill_in "trackname", with: name
	fill_in "genre", with: "Alternative"
	attach_file 'file', Rails.root.join('spec','fixtures','testsong.mp3')
	click_button "Upload"
end