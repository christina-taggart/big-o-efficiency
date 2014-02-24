class RemoveIndexFromUser < ActiveRecord::Migration
  def change
    remove_index :users, :total_karma
  end
end
