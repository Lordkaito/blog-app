require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jhon', photo: 'Link to a photo', bio: 'text', posts_counter: 2) }
  before { subject.save }

  describe 'User model' do
    it 'Should be a valid user' do
      expect(subject).to be_valid
    end

    it 'Should be invalid if no name given' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'Should be invalid if posts_counter is nil' do
      subject.posts_counter = nil
      expect(subject).not_to be_valid
    end
  end

  describe 'User methods' do
    it 'recent_posts_from_user should work' do
      subject.posts.create!(title: 'Title 1', text: 'Post text content', likes_counter: 0, comments_counter: 0)
      subject.posts.create!(title: 'Title 2', text: 'Post text content', likes_counter: 0, comments_counter: 0)
      subject.posts.create!(title: 'Title 3', text: 'Post text content', likes_counter: 0, comments_counter: 0)

      posts = subject.recent_posts_from_user
      expect(posts.length).to eql 3
    end
  end
end
