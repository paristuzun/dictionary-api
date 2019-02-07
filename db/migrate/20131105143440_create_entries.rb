class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.text :body
      t.integer :user_id
      t.integer :topic_id
      t.timestamps
    end
  end
end
