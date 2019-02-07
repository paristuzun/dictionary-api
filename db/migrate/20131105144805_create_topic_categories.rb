class CreateTopicCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_categories do |t|
      t.integer :topic_id
      t.integer :category_id
    end
  end
end
