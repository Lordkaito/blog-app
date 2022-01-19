class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes

  after_save :update_comment_counter_for_a_post

  def update_comment_counter_for_a_post
    post.update(comments_counter: post.comments.count)
  end

  Comment.create(text: 'This is the first comment left by Jhon on the first post of himself', user_id: 1, post_id: 1)
  Comment.create(text: 'This is the second comment left by Jhon on the first post of himself', user_id: 1, post_id: 1)
  Comment.create(text: 'This is the third comment made by Jhon on the second post of himself', user_id: 1, post_id: 2)
  Comment.create(text: 'This is the first comment made by Peter on his first post', user_id: 2, post_id: 3)
end
