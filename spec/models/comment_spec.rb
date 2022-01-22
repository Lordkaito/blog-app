require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    @user1 = User.new(name: 'Jhon', photo: 'Link to photo', bio: 'text', posts_counter: 2)
    Post.create!(title: 'Title', text: 'Post text content', likes_counter: 0, comments_counter: 0, user: @user1)
  end

  describe 'update_comment_counter_for_a_post' do
    it 'Should increment comments_counter by 1 each' do
      @user2 = User.create!(name: 'Peter', photo: 'Link to photo', bio: 'text', posts_counter: 1)
      @user2.comments.create!(text: 'First comment', post: subject)
      @user2.comments.create!(text: 'Second comment', post: subject)
      @user2.comments.create!(text: 'Third comment', post: subject)
      @user2.comments.create!(text: 'Forth comment', post: subject)
      @user2.comments.create!(text: 'Fifth comment', post: subject)

      expect(subject.comments_counter).to eql 5
    end
  end
end
