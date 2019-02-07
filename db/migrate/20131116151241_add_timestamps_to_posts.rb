class AddTimestampsToPosts < ActiveRecord::Migration[5.2]
  def change
  	add_column :topics, :created_at, :datetime
  	add_column :topics, :updated_at, :datetime
  end
end
