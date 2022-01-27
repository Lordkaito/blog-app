require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    @user = User.new(name: 'Jhon', photo: 'Link to a photo', bio: 'text', posts_counter: 2)
    Post.create!(title: 'Title 1', text: 'Post text content', likes_counter: 0, comments_counter: 0, user: @user)
  end

  describe 'Post model' do
    it 'Should be a valid post' do
      expect(subject).to be_valid
    end

    it 'Should be invalid if no title given' do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it 'Should be invalid if text is longer 250 characters' do
      subject.title = 'A' * 260
      expect(subject).not_to be_valid
    end

    it 'Should be invalid if text is nil' do
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it 'Should be invalid if likes_counter is nil' do
      subject.likes_counter = nil
      expect(subject).not_to be_valid
    end

    it 'Should be invalid if comments_counter is nil' do
      subject.comments_counter = nil
      expect(subject).not_to be_valid
    end
  end

  describe 'Post methods' do
    it 'Should test the functionality of five_recent_posts' do
      @user2 = User.create!(name: 'Peter', photo: 'Link to photo', bio: 'Text', posts_counter: 1, email: 'test@email.com', password: 'test123')
      first_comment = @user2.comments.create!(text: 'First comment made by Peter', post: subject)
      second_comment = @user2.comments.create!(text: 'Second comment made by Peter', post: subject)
      third_comment = @user2.comments.create!(text: 'Third comment made by Peter', post: subject)
      fourth_comment = @user2.comments.create!(text: 'Fourth comment made by Peter', post: subject)
      fifth_comment = @user2.comments.create!(text: 'Fifth comment made by Peter', post: subject)

      total_comments = subject.recent_comments_from_user
      expect(total_comments.length).to eql 5
      expect(total_comments).to match_array([fifth_comment, fourth_comment, third_comment, second_comment, first_comment])
    end
  end
end
