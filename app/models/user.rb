class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true, length: { maximum: 50 }

  def recent_posts_from_user
    posts.order(created_at: :desc).limit(3)
  end

  def all_posts_from_user
    posts.order(created_at: :desc)
  end
end
