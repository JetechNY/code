class CreateUsers < ActiveRecord::Migration[5.1]

    def change
        create_table :users do |t|
          #primary key of :id is created for us!
          t.string :username
          t.string :password
          
        end
    end
end