class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_like_counter_for_a_post

  private

  def update_like_counter_for_a_post
    post.update(likes_counter: post.likes.count)
  end
end
