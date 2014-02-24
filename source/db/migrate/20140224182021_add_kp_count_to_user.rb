class AddKpCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :kp_count, :integer
  end
end
