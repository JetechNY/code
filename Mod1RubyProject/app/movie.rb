class Movie < ActiveRecord::Base
    
    has_many :reviews
    has_many :users, through: :reviews

    # def self.movie_film(film)
    #     movies=self.all.select{|movie|movie.film == film}
    #     if movies == []
    #         puts "Sorry movie not found, please try another movie title"
    #         @prompt.keypress("Press any key to return to movie search")
    #         self.movie_search        
    #     else            
    #         puts "Your movie details"
    #         movies
    #         @prompt.keypress("Press any key to return to movie search")
    #         self.movie_search
    #     end
    # end

    # def self.movie_genre(genre)
    #     puts "Movies with your genre"
    #     self.all.select{|movie|movie.genre == genre}
        
    # end


end


# api pulling later?
## API Requests ================================================

# def movie_loop
#     loop do
#         self.spaces
#         system("clear")
#         movie = @@prompt.ask("Search movie / show:")
#         puts ""
#         Getdata.get_movie(movie)
#         puts ""
#         puts ""
#         watch = @@prompt.select("Is that the one?", ["Yes, thanks Jarvis.", "No, search another movie."])
#         if watch == "Yes, thanks Jarvis."
#             break
#         end
#     end
# end

# def spaces
#     puts ""
#     puts ""
#     puts ""
# end
