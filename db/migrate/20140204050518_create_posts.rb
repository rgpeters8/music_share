class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description
      t.string :title
      t.integer :user_id
      t.integer :play_count, :default => 0
      t.string :playlist
      t.string :youtube_id
      t.string :category

      t.timestamps
    end
    
    add_index :posts, [:user_id, :created_at]
    add_index :posts, [:youtube_id]
  end
end
