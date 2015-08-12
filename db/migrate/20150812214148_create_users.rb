class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :city
      t.string :country
      t.string :gender
      t.string :body_type
      t.timestamps null: false
    end
  end
end
