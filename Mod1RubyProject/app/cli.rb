require 'rest-client' 
require 'json'
require 'pry'
require 'tty-prompt'

class CLI 
   
    def initialize()
        pastel = Pastel.new.white.on_cyan.detach
        @prompt = TTY::Prompt.new(active_color: pastel)
        # @@user = [] 
    end
    
    # def self.user
    #     @@user
    # end

    def welcome    
        puts "Welcome to Movie Review Express!"
        sleep(1)
        user_select = @prompt.select('Choose an option!') do |menu|     
            menu.choice 'New User', 1
            menu.choice 'Returning User', 2
            menu.choice 'Quit', 3
        end
            if user_select == 1
                self.new_login
            elsif user_select == 2
                self.returning_login
            elsif user_select == 3
                self.quit
            end
    end

    def new_login
        userinput = @prompt.ask("Please enter a username:", required: true, active_color: :red)
        username = User.find_by(username: userinput)    
            if username == nil
                passwordinput = @prompt.mask('Please enter a password:', required: true, active_color: :white)
                puts "Thank you. Account created. Your username is #{userinput}"
                sleep(3)
                username = User.create(username: userinput, password: passwordinput)
            else
                puts "Sorry, that username is already taken."
                sleep(1)
                self.welcome
            end        
        self.menu 
        # @@user << username
    end
    
    def returning_login
        userinput = @prompt.ask("Please enter a username:", required: true, active_color: :red)
        user = User.find_by(username: userinput)   
            if user == nil
                puts "Sorry. User not found"
                self.returning_login
            else passwordinput = @prompt.mask('Please enter a password:', required: true, active_color: :white)
                userpass= User.find_by(username: userinput, password: passwordinput)
                if userpass == nil
                    puts "Sorry. Wrong password"
                    self.returning_login
                else
                    puts "Hello, #{user.username}. Welcome back."
                end 
            end           
        self.menu 
    end
    
    def menu
        puts "Main Menu"
        user_select = @prompt.select('Choose an option!',per_page: 10) do |menu|     
            menu.choice 'Search for Movies', 1
            menu.choice 'Reviews', 2
            menu.choice 'User Profile', 3
            menu.choice 'Quit', 4
        end
    
        if user_select == 1
            self.movie_search
        elsif user_select == 2
            self.review
        elsif user_select == 3
            self.user_profile
        else user_select == 4
            self.quit
        end           
        system("clear")
    end

    def movie_search
        system("clear")
        userselect = @prompt.select('Choose an option!') do |menu|     
            menu.choice 'Search for Movie by Title', 3
            menu.choice 'Search for Movie by Genre', 2
            menu.choice 'List all for Movies', 1
            menu.choice 'Main Menu', 4
            end
            
            if userselect == 3
                self.search_movie_title
            elsif userselect == 2
                self.search_movie_genre
            elsif userselect == 1
                self.movie_list
            else userselect == 4
                self.menu
            end
    end

    def movie_list
        system('clear')
        puts "---------"
        userselect = @prompt.select("Choose movie",per_page: 20) do |menu| 
            Movie.all.each {|movie|menu.choice "#{movie.film}"}
        end
            movie = Movie.find_by_film(userselect)
            puts "Title: #{movie.film}"
            puts "Genre: #{movie.genre}"
            puts "Director: #{movie.director}"
            puts "Release Year: #{movie.release_year}"
            puts "IMDB Link: #{movie.imdb_link}"
            puts "Country: #{movie.country}"
            puts "Oscars: #{movie.oscars_won}"
            puts "Actors: #{movie.actors}"
            @prompt.keypress("Press any key to return to movie search")
            self.movie_search
    end

    def search_movie_title
        search_title = @prompt.ask("What is the name of the movie are you looking for?")
            if search_title == nil
                "Please enter a movie title"
                self.search_movie_title
            else 
                movies = Movie.all.select {|movie|movie.film == search_title}
                    if movies == nil # not working!!!!
                        puts "Sorry movie not found, please try another movie title"
                        @prompt.keypress("Press any key to return to movie search")
                        self.movie_search        
                    else            
                        puts "Your movie details"
                        puts movies
                        @prompt.keypress("Press any key to return to movie search")
                        self.movie_search
                    end
                end
            end

            def movie_genre(genre)
                puts "Movies with your genre"
                Movie.find_by_genre(genre)
                sleep(5)
                @prompt.keypress("Press any key to return")
                # self.all.select{|movie|movie.genre == genre}
            end
            
            def search_movie_genre
                userselect = @prompt.select('What movie genre are you looking for?',per_page: 10) do |menu|
                    menu.enum "."   
                    
                    menu.choice 'Romance', 1
                    menu.choice 'Crime', 2
                    menu.choice 'Comedy', 3
                    menu.choice 'Action', 4
                    menu.choice 'Arthouse and Drama', 5
                    menu.choice 'Sci-Fi and Fantasy', 6
                    menu.choice 'Horror', 7
                    menu.choice 'Return to main menu', 8
                    menu.choice 'Go to Reviews', 9
            end
                if userselect == 1
                    puts "Your recommended Romance movies"
                    puts Movie.all.select{|movie|movie.genre == "Romance"}.map{|n|n.film}
                    @prompt.keypress("Press any key to return to movie search")
                    self.search_movie_genre        
                elsif userselect == 2
                    puts "Your recommended Crime movies"
                    puts Movie.all.select{|movie|movie.genre == "Crime"}.map{|n|n.film}
                    @prompt.keypress("Press any key to return to movie search")
                    self.search_movie_genre           
                elsif userselect == 3
                    puts "Your recommended Comedy movies"
                    puts Movie.all.select{|movie|movie.genre == "Comedy"}.map{|n|n.film}
                    @prompt.keypress("Press any key to return to movie search")
                    self.search_movie_genre           
                elsif userselect == 4
                    puts "Your recommended Action movies"
                    puts Movie.all.select{|movie|movie.genre == "Action"}.map{|n|n.film}
                    @prompt.keypress("Press any key to return to movie search")
                    self.search_movie_genre         
                elsif userselect == 5 
                    puts "Your recommended Arthouse and Drama movies"
                    puts Movie.all.select{|movie|movie.genre == "Arthouse and Drama"}.map{|n|n.film}
                    @prompt.keypress("Press any key to return to movie search")
                    self.search_movie_genre   
                elsif userselect == 6
                    puts "Your recommended Scifi and Fantasy movies"
                    puts Movie.all.select{|movie|movie.genre == "Scifi"}.map{|n|n.film}
                    @prompt.keypress("Press any key to return to movie search")
                    self.search_movie_genre     
                elsif userselect == 7 
                    puts "Your recommended Horror movies"
                    puts Movie.all.select{|movie|movie.genre == "Horror"}.map{|n|n.film}
                    @prompt.keypress("Press any key to return to movie search")
                    self.search_movie_genre      
                elsif userselect == 8 
                    self.menu
                else userselect == 9
                    self.review
                end
        
    end
    

    # def get_movie_details(id)
    #     movie = Movie.all.find {|movie| movie.id == id}
    #     system "clear"
    #     ap "----------------------------------------------------------------"
    #     ap "NAME: #{movie.film}"
    #     ap "GENRE: #{movie.genre}"
    #     ap "DIRECTOR: #{movie.director}"
    #     ap "RELEASE: #{movie.release_year}"
    #     ap "IMDB: #{movie.imdb_link}" 
    #     ap "COUNTRY: #{movie.country}"
    #     ap "OSCAR: #{movie.oscars_won}"
    #     ap "ACTOR: #{movie.actors}"
    #     ap "----------------------------------------------------------------"
    # end

    def movieinfo(movie_id)
        # puts movie.movie_id info into readable format
        # asks user if they want to see review info for the movie
        user_select = @prompt.select("Would you like to see the review(s) of this movie?") do |menu|
            menu.choice 'Yes', 1
            menu.choice 'No, Back to main menu', 2
        end
        
        if user_select == 1
            self.review
        else userselect == 2
            self.menu
        end
    end



    def review
        user_select = @prompt.select('Please choose an option') do |menu|        
            menu.choice 'See your Reviews', 1
            menu.choice 'Make a Review', 2
            menu.choice 'Return to Main Menu', 3
            menu.choice 'Quit', 4
        end

        if user_select == 1
            self.fetch_reviews            # list reviews by user temp!!!!!
        elsif user_select == 2
            self.create_review            # pick a movie to review? temp!!!!!
        elsif user_select == 3
            self.menu    
        else user_select == 4
            self.quit

        end
    end

    def fetch_reviews(user)
        revu_inst = Review.where(user_id: user.id)
        if revu_inst == []
            puts "Sorry, you have no reviews. Plase make a review"
            prompt_menu(user)
        else
            puts "My Reviews"
            puts "--------------------"
            review_ids = revu_inst.collect do |row|
                row.review_ids
            end
            all_reviews = review_ids.collect do |x|
                puts Review.find(x).review
            end
        end
    end

    def create_review
        review = "MOVIE REVIEW STRING"
        Review.create(user_id, movie_id, review)
    end

    def user_profile
        user_select = @prompt.select('Please choose an option') do |menu|        
            menu.choice 'Change username', 1
            menu.choice 'Change password', 2
            menu.choice 'Delete account', 3
            menu.choice 'Quit', 4
        end   
        if user_select == 1
            username = @prompt.ask("Please enter a new username:", required: true)
            User.update(username: username) #currently makes all Users change!!!! 
        elsif user_select == 2
            password = @prompt.mask('Please enter a new password:', required: true)  
            self.update(password: password) #currently makes all Users change!!!!      
        elsif user_select ==3
            @prompt.ask("Are you sure you want to delete your account?")
            #Yes continue, No Exit to user_profile
            self.destroy
        else user_select == 4
            self.quit    
        end
         
    end


    def quit
    puts "Thank you for using Movie Review Express!"
    puts "by Shevaughn & SunJet"
        sleep(1)
    puts "Goodbye"
        sleep(1)
        exit
    end

end


