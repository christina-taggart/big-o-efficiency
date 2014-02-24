class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :karma_points, :user_id, :name => 'user_id_ix'
  end
end
