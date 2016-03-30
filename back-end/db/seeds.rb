# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(id: 1, email:'admin@gmail.com', password: '12345678', balance: 100)
Artist.create(email:'artist@gmail.com', password: '12345678', balance:0)
Artist.create(email:'artist2@gmail.com', password: '12345678', balance:0)
Track.create(id: 1, artist_id: 1)
Track.create(id:2, artist_id:1)
Track.create(id:3, artist_id:2)
