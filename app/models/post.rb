class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :youtube_id, presence: true
  validates :description, length: { maximum: 225 }
  validates :title, presence: true, length: { maximum: 100 } 
  validates :category, presence: true
end
