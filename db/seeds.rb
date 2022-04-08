# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# Movie.destroy_all
# Teather.destroy_all
# Room.destroy_all
# Seat.destroy_all
# Exibithion.destroy_all

# puts "Seeding movies"
# url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}&language=en-US&page=1"
# # binding.pry
# movies_serialized = URI.open(url).read
# movies = JSON.parse(movies_serialized)
# movies['results'].each do |movie|
#   # binding.pry
#   movie = Movie.create!(
#     title: movie['title'],
#     overview: movie['overview'],
#     # rating: movie['vote_average'].to_f * 10,
#     # original_language: movie['original_language'],
#     # original_title: movie['original_title'],
#     poster_path: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
#     backdrop_path: "https://image.tmdb.org/t/p/w500#{movie['backdrop_path']}",
#     release_date: movie['release_date']
#   )
# end

# puts "#{Movie.count} movies created\nzo/"

# puts 'creating teathers'

# Teather.create!([
#   { name: "Cinemark", address: "Botafogo, Rio de Janeiro", city: "Rio de Janeiro", state: "RJ" },
#   { name: "Sao Luiz", address: "Laranjeiras, Rio de Janeiro", city: "Rio de Janeiro", state: "RJ" }
# ])

# puts "#{Teather.count} Teathers created\nzo/"

# puts 'creating rooms'

# Room.create!([
#   { capacity: 2, teather: Teather.first },
#   { capacity: 13, teather: Teather.second }
# ])

# puts "#{Room.count} Rooms created\nzo/"

# puts 'creating Seats'

# Seat.create!([
#   { seat_type: 'regular', available: true, room: Room.first },
#   { seat_type: 'premium', available: true, room: Room.first },
#   { seat_type: 'regular', available: true, room: Room.second }
# ])

# puts "#{Seat.count} Seats created\nzo/"

# puts 'creating Exibithions'

# Exibithion.create!(
#   [
#     { start_time: DateTime.new(Date.today.year, Date.today.month, Date.tomorrow.day, 18, 45),
#       movie: Movie.find(24),
#       room: Room.first },
#     { start_time: DateTime.new(Date.today.year, Date.today.month, Date.tomorrow.day, 21, 20),
#       movie: Movie.find(24),
#       room: Room.first },
#     { start_time: DateTime.new(Date.today.year, Date.today.month, Date.tomorrow.day, 21, 20),
#       movie: Movie.find(28),
#       room: Room.second }
#   ]
# )

# puts "#{Exibithion.count} Exibithions created\nzo/"
