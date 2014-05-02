class Post < ActiveRecord::Base
  acts_as_votable

  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :youtube_id, presence: true
  validates :description, length: { maximum: 225 }
  validates :title, presence: true, length: { maximum: 100 } 
  validates :category, presence: true
  
  # Returns posts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
