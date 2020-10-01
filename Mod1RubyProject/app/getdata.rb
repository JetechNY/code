  
class Getdata
    @@prompt = TTY::Prompt.new

## OMDb API ===================================================
    def self.get_movie(title)
        if title
            formatted_title = title.split(" ").join("+")
            response = RestClient.get("http://www.omdbapi.com/?apikey=7c5312b1&t=#{formatted_title}")
            articles = JSON.parse(response)
            self.filter_false_response(articles)
        else
            puts "Try again..."
            movie = @@prompt.ask("Search movie / show:")
            self.get_movie(movie)
        end
    end

    def self.filter_false_response(articles)
        if articles["Response"] == "False"
            puts "Try again..."
            movie = @@prompt.ask("Search move / show:")
            self.get_movie(movie)
        else
            title = articles["Title"]
            year = articles["Year"]
            runtime = articles["Runtime"]
            genre = articles["Genre"]
            imdb = articles["imdbRating"]
            imdb_count = articles["imdbVotes"]
            metascore = articles["Metascore"]

            puts "Title: #{title}"
            puts "Year: #{year}"
            puts "Runtime: #{runtime}"
            puts "Genre: #{genre}"
            puts "IMDb: #{imdb}"
            puts "IMDb ratings count: #{imdb_count}"
            puts "Metascore: #{metascore}"
        end
    end
end