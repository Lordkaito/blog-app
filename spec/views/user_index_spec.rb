require 'rails_helper'

RSpec.describe 'Users page', type: :feature do
  before(:each) do
    visit user_session_path

    @test_user1 = User.create(name: 'test1', photo: 'test_photo1', confirmed_at: Time.now, bio: 'text1', posts_counter: 2, email: 'test1@gmail.com', password: 'test11')
    test_user2 = User.create(name: 'test2', photo: 'test_photo2', bio: 'text2', posts_counter: 3, email: 'test2@gmail.com', password: 'test22')
    test_user3 = User.create(name: 'test3', photo: 'test_photo3', bio: 'text3', posts_counter: 5, email: 'test3@gmail.com', password: 'test33')
    test_user4 = User.create(name: 'test4', photo: 'test_photo4', bio: 'text4', posts_counter: 4, email: 'test4@gmail.com', password: 'test44')

    fill_in 'Email', with: 'test1@gmail.com'
    fill_in 'Password', with: 'test11'
    click_button 'Log in'
    visit users_path
  end

  describe 'Users index page' do
    scenario 'displays list of users' do
      expect(page).to have_content('test1')
      expect(page).to have_content('test2')
      expect(page).to have_content('test3')
      expect(page).to have_content('test4')
    end

    scenario 'displays the correct profile picture' do
      img = page.all('img')

      expect(img[0]['src']).to eq 'test_photo1'
      expect(img[1]['src']).to eq 'test_photo2'
      expect(img[2]['src']).to eq 'test_photo3'
      expect(img[3]['src']).to eq 'test_photo4'
    end

    scenario 'displays the correct number of posts' do
      posts = page.all('.post_count')

      expect(posts.size).to eq 4
      expect(posts[0]).to have_content '2'
      expect(posts[1]).to have_content '3'
      expect(posts[2]).to have_content '5'
      expect(posts[3]).to have_content '4'
    end

    scenario 'all posts link' do
      click_link 'test1'
      expect(page).to have_current_path user_path(@test_user1)
    end
  end
end
