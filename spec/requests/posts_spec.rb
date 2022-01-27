require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # subject { User.new(name: 'Jhon', photo: 'Link to a photo', bio: 'text', posts_counter: 2) }
  # before { subject.save }
  before(:each) do
    visit user_session_path

    @test_user1 = User.create(name: 'test1', photo: 'test_photo1', confirmed_at: Time.now, bio: 'text1', posts_counter: 1, email:"test1@gmail.com",password:"test11")
    test_user2 = User.create(name: 'test2', photo: 'test_photo2', bio: 'text2', posts_counter: 3, email:"test2@gmail.com",password:"test22")
    test_user3 = User.create(name: 'test3', photo: 'test_photo3', bio: 'text3', posts_counter: 5, email:"test3@gmail.com",password:"test33")
    test_user4 = User.create(name: 'test4', photo: 'test_photo4', bio: 'text4', posts_counter: 4, email:"test4@gmail.com",password:"test44")
    @post = Post.create(title: 'test_title', text: 'test_body', user_id: @test_user1.id, comments_counter: 0, likes_counter: 0, created_at: Time.now)
    @comment = Comment.create(text: 'test_comment', user_id: @test_user1.id, post_id: @post.id, created_at: Time.now)
    fill_in 'Email', with: 'test1@gmail.com'
    fill_in 'Password', with: 'test11'
    click_button 'Log in'
    visit users_path
    visit user_posts_path(@test_user1.id)

  end
  describe 'GET /posts' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end

    it 'includes the name of the user' do
      get '/users/1/posts'
      expect(response.body).to include(subject.name)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end
  end
end
