class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_like_counter_for_a_post
    post.update(likes_counter: post.likes.count)
  end
end
