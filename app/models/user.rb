class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true, length: { maximum: 50 }
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts_from_user
    posts.order(created_at: :desc).limit(3)
  end

  def all_posts_from_user
    posts.order(created_at: :desc)
  end

  User.create(name: 'Jhon', photo: 'Link to a photo',
              bio: 'Lorem ipsum dolor sit amer, consectetur adipiscing ellit. Ut tempor turpis ac venenatis elementum, purus arcu fermentum orci, porta ultrices diam ex ut turpis. Vestibulum in elit sed est vehicula hendrerit. Nullam sit amet suscipit ante. Sed in accumsan lacus.', posts_counter: 2)
  User.create(name: 'Peter', photo: 'Link to a photo',
              bio: 'Lorem ipsum dolor sit amer, consectetur adipiscing ellit. Ut tempor turpis ac venenatis elementum, purus arcu fermentum orci, porta ultrices diam ex ut turpis.', posts_counter: 1)
end
