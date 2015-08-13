class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :birth_year
      t.string :country
      t.string :size
      t.timestamps null: false
    end
  end
end
