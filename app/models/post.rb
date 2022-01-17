class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def udpate_post_counter_for_a_user
    user.update(posts_counter: user.posts.count)
  end

  def recent_posts_from_user
    user.posts.order(created_at: :desc).limit(5)
  end
end
