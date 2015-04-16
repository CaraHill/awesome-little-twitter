class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :full_name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :gravatar_link
      t.string :bio

      t.timestamps

    end
  end
end
