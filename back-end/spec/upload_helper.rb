def create_track_with_file(name="default")
	Track.create(name: name,
               genre: "Electro",
               file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
end

def create_track_with_file_and_image(name="default")
	Track.create(name: name,
               genre: "Electro",
               file: fixture_file_upload("testsong.mp3", 'audio/mpeg'),
               image: fixture_file_upload("testimage.png", 'image/png'))
end

def upload_track(name="default track")
	click_link('Upload Sound')
	fill_in "trackname", with: name
	fill_in "genre", with: "Alternative"
	attach_file 'file', Rails.root.join('spec','fixtures','testsong.mp3')
	click_button "Upload"
end