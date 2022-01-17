class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def recent_posts_from_user
    posts.order(created_at: :desc).limit(3)
  end
end
