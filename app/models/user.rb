class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def recent_posts_from_user
    posts.order(created_at: :desc).limit(3)
  end

User.create(name: "Jhon", photo: "Link to a photo", bio: "I am a developer", posts_counter: 0)
User.create(name: "Peter", photo: "Link to a photo", bio: "I am a software developer", posts_counter: 0)
end
