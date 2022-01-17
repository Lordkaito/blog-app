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
    author.increment!(:posts_counter)
  end

end
