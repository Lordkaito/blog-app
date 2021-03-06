class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes

  after_save :update_comment_counter_for_a_post

  def update_comment_counter_for_a_post
    post.update(comments_counter: post.comments.count)
  end
end
