class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :name
      t.text :message
      t.string :img
      t.string :screen_name

      t.timestamps null: false
    end
  end
end
