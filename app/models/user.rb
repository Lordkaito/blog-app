class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :jwt_authenticatable, :registerable, :confirmable, jwt_revocation_strategy: self

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
