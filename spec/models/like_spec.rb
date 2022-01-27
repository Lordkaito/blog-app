require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    @user1 = User.new(name: 'Jhon', photo: 'Link to photo', bio: 'text', posts_counter: 2)
    Post.create!(title: 'Post title', text: 'Post text content', likes_counter: 0, comments_counter: 2, user: @user1)
  end

  describe 'update_like_counter_for_a_post' do
    it 'Should increment likes_counter by 1 each' do
      @user2 = User.create!(name: 'Peter', photo: 'Link to photo', bio: 'Text', posts_counter: 1, email: 'test@email.com', password: 'test123')
      @user2.likes.create!(post: subject)
      @user2.likes.create!(post: subject)
      @user2.likes.create!(post: subject)
      @user2.likes.create!(post: subject)
      @user2.likes.create!(post: subject)

      expect(subject.likes_counter).to eql 5
    end
  end
end
