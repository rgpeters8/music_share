class AddDefaultValueToPlayCount < ActiveRecord::Migration
  def change
   change_column :posts, :play_count, :integer, :default => 0
  end
end
