require 'rails_helper'

RSpec.describe 'Users show page', type: :feature do
  before(:each) do
    visit user_session_path

    @test_user1 = User.create(name: 'test1', bio: 'this is a bio', photo: 'test_photo1', confirmed_at: Time.now, posts_counter: 2, email: 'test1@gmail.com', password: 'test11')

    fill_in 'Email', with: 'test1@gmail.com'
    fill_in 'Password', with: 'test11'
    click_button 'Log in'

    @post1 = @test_user1.posts.create(title: 'Post 1', text: 'This is a test post 1', comments_counter: 0, likes_counter: 0)
    post2 = @test_user1.posts.create(title: 'Post 2', text: 'This is a test post 2', comments_counter: 0, likes_counter: 0)
    post3 = @test_user1.posts.create(title: 'Post 3', text: 'This is a test post 3', comments_counter: 0, likes_counter: 0)

    visit user_path(@test_user1)
  end

  describe 'Users index page' do
    scenario 'displays the profile picture' do
      profile_pic = page.find('img')['src']
      expect(profile_pic).to eq 'test_photo1'
    end

    scenario 'displays the user\'s username' do
      expect(page).to have_content 'test1'
    end

    scenario 'displays the user\'s bio' do
      expect(page).to have_content 'this is a bio'
    end

    scenario 'displays the user\'s first three posts' do
      posts = page.all('.post-container')
      expect(posts.size).to eq 3
    end

    scenario 'user\'s post link redirects to the post\'s show page' do
      click_link 'See all posts'
      click_link 'Post 1'
      expect(page).to have_current_path(user_post_path(@test_user1, @post1))
    end

    scenario 'displays button to see all user\'s posts' do
      expect(page).to have_link 'See all posts'
    end

    scenario 'See all posts redirects to posts index page' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@test_user1))
    end
  end
end
