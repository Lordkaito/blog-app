class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  after_save :udpate_post_counter_for_a_user

  def recent_comments_from_user
    comments.order(created_at: :desc).limit(5)
  end

  def show_all_comments_from_user
    comments.order(created_at: :desc)
  end

  private

  def udpate_post_counter_for_a_user
    user.update(posts_counter: user.posts.count)
  end

  Post.create(title: 'Jhon first post', text: 'This is the first post made by Jhon', comments_counter: 2,
              likes_counter: 0, user_id: 1)

  Post.create(title: 'Jhon second post', text: 'This is the second post made by Jhon', comments_counter: 1,
              likes_counter: 0, user_id: 1)

  Post.create(title: 'Peter first post', text: 'This is the first post made by Peter', comments_counter: 0,
              likes_counter: 0, user_id: 2)
end
