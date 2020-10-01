class CreateReviews < ActiveRecord::Migration[5.1]

    def change
        create_table :reviews do |t|
          #primary key of :id is created for us!
          t.integer :user_id
          t.integer :movie_id
          t.string :review
          
        end
    end
end