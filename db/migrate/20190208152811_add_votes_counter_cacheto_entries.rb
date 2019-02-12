class AddVotesCounterCachetoEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :votes_count, :integer
  end
end
