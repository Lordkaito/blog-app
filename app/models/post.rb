class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :udpate_post_counter_for_a_user

  def recent_comments_from_user
    comments.order(created_at: :desc).limit(5)
  end

  private
  def udpate_post_counter_for_a_user
    user.update(posts_counter: user.posts.count)
  end

  Post.create(title: 'First post', text: 'This is the first post', comments_counter: 0, likes_counter: 0, user_id: 1)

  Post.create(title: 'Second post', text: 'This is the second post', comments_counter: 0, likes_counter: 0, user_id: 1)

  Post.create(title: 'Third post', text: 'This is the third post', comments_counter: 0, likes_counter: 0, user_id: 2)
end
