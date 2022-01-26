class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :udpate_post_counter_for_a_user

  def recent_comments_from_user
    comments.order(created_at: :desc).limit(5)
  end

  def show_all_comments_from_user
    puts comments
    comments.order(created_at: :desc)
  end

  private

  def udpate_post_counter_for_a_user
    user.update(posts_counter: user.posts.count)
  end
end
