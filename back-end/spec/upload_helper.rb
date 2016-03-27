def create_track_with_file
  Track.create(name: "Song1", genre: "Electro", file: fixture_file_upload("testsong.mp3", 'audio/mpeg'))
end