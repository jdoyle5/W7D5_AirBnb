# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ username: 'ChetFaker' }, { username: 'BetTaker' }, { username: 'TetBaker' }])
Artwork.create([{ artist_id: 1, title: 'The Beauty of Chet Faker', image_url: 'chetfakerbeauty.gov' },
  { artist_id: 2, title: 'Take Your Bets: A Visual Memoir', image_url: 'bettakermemoir.edu'},
  { artist_id: 3, title: 'Tet Not Ted', image_url: 'tetnotted.co.uk' }])
SharedWork.create([{ artwork_id: 1, viewer_id: 2}, { artwork_id: 1, viewer_id: 3},
  { artwork_id: 2, viewer_id: 1}, { artwork_id: 2, viewer_id: 3}, { artwork_id: 3, viewer_id: 1}])
