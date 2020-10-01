#lib/seeds/import.rake
require 'rest-client' # actually let you hit the endpoint 
require 'json' # parse the response body into a form you can use 
require 'pry'
require 'uri'
require 'net/http'
require 'openssl'
require 'csv'

Movie.destroy_all

Movie.create(film:"Brief Encounter", genre: "Romance", director: "David Lean", release_year: 1945, imdb_link: "http://www.imdb.com/title/tt0037558/", country: "UK", oscars_won: 0, actors: "Celia Johnson, Cyril Raymond, Stanley Holloway, Trevor Howard")
Movie.create(film: "Casablanca", genre: "Romance", director: "Michael Curtiz",release_year: 1942,imdb_link: "http://www.imdb.com/title/tt0034583/",country: "USA")
Movie.create(film: "Before Sunrise", genre: "Romance", director: "Richard Linklater",release_year: 1995,imdb_link: "http://www.imdb.com/title/tt0112471/",country: "USA")
Movie.create(film: "Before Sunset", genre: "Romance", director: "Richard Linklater",release_year: 2004,imdb_link: "http://www.imdb.com/title/tt0381681",country: "USA")
Movie.create(film: "Breathless", genre: "Romance", director: "Jean-Luc Godard",release_year: 1960,imdb_link: "http://www.imdb.com/title/tt0053472/",country: "France")
Movie.create(film: "In the Mood for Love", genre: "Romance", director: "Kar Wai Wong",release_year: 2000,imdb_link: "http://www.imdb.com/title/tt0118694/",country: "Hong Kong")

Movie.create(film: "2001", genre:"Scifi", director:"Stanley Kubrick", release_year: 1968, imdb_link: "http://www.imdb.com/title/tt0062622/",country: "USA")
Movie.create(film: "Metropolis", genre:"Scifi", director:"Fritz Lang", release_year: 1927, imdb_link: "http://www.imdb.com/title/tt0017136/",country: "Germany")
Movie.create(film: "Blade Runner", genre:"Scifi", director:"Ridley Scott", release_year: 1982, imdb_link: "http://www.imdb.com/title/tt0083658/",country: "USA")
Movie.create(film: "Alien", genre:"Scifi", director:"Ridley Scott", release_year: 1979, imdb_link: "http://www.imdb.com/title/tt0078748/",country: "USA")
Movie.create(film: "The Wizard of Oz", genre:"Scifi", director:"Victor Fleming", release_year: 1939, imdb_link: "http://www.imdb.com/title/tt0032138/",country: "USA")
Movie.create(film: "ET", genre:"Scifi", director:"Steven Spielberg", release_year: 1982, imdb_link: "http://www.imdb.com/title/tt0083866/",country: "USA")
Movie.create(film: "Solaris", genre:"Scifi", director:" Andrei Tarkovsky", release_year: 1972, imdb_link: "http://www.imdb.com/title/tt0069293/",country: "USA")

# Movie.create(film: , genre: , director: , release_year: , imdb_link: , country: , oscars_won: , actors:  )

#try 1
# csv_text = File.read('./lib/seeds/movielist.csv')
# csv = CSV.parse(csv_text, :headers => true)

# try 2
# csv = CSV.new(body, :headers => true, :header_converters => :symbol, :converters => [:all, :blank_to_nil])
# csv.to_a.map {|row| row.to_hash }
# => [{:year=>1997, :make=>"Ford", :model=>"E350", :description=>"ac, abs, moon", :price=>3000.0}, {:year=>1999, :make=>"Chevy", :model=>"Venture \"Extended Edition\"", :description=>nil, :price=>4900.0}, {:year=>1999, :make=>"Chevy", :model=>"Venture \"Extended Edition, Very Large\"", :description=>nil, :price=>5000.0}, {:year=>1996, :make=>"Jeep", :model=>"Grand Cherokee", :description=>"MUST SELL!\nair, moon roof, loaded", :price=>4799.0}]

# try 3
# CSV.foreach(data_file, headers: true) do |row|
#     puts row.inspect # hash
#   end

# try 4
# CSV.new(body, headers: true).map(&:to_hash)

#try 5
# csv = CSV.open('./lib/seeds/movielist.csv', :headers => true).map(&:to_h)

#   csv.each do |row|
#     t = CreateMovies.new

#     t.film = row['Film']
#     t.genre = row['Genre']
#     t.director = row['Director']
#     t.release = row['Year released']
#     t.imdb_link = row['IMDB link']
#     t.country = row['Country']
#     t.save
# end

# data_file = './lib/seeds/movielist.csv'
# data = []
# CSV.foreach(data_file, headers: true) do |row|
#   data << row.to_hash
# end
