class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :user_id
    end
  end
end
