class CreateMovies < ActiveRecord::Migration[5.1]

    def change
        create_table :movies do |t|
          #primary key of :id is created for us!
          t.string :film
          t.string :genre
          t.string :director
          t.integer :release_year
          t.string :imdb_link
          t.string :country
          t.integer :oscars_won
          t.string :actors
               
        end
    end
end