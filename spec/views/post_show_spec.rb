require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
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


    describe 'Post show page' do
        it 'Shows the post title' do
            expect(page).to have_content(@post.title)
        end

        it 'Shows the name of the user' do
          expect(page).to have_content(@test_user1.name)
        end

        it 'Shows the number of comments each post has' do
          expect(page).to have_content(@post.comments_counter)
        end

        it 'Shows the number of likes each post has' do
          expect(page).to have_content(@post.likes_counter)
        end

        it 'Shows the text of each post' do
          expect(page).to have_content(@post.text)
        end

        it 'Shows the name of the commentor' do
          expect(page).to have_content('test1')
        end

        it 'Shows the text of each comment' do
          expect(page).to have_content('test_comment')
        end
    end
end