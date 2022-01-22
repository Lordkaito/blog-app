require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:each) do
      @user = User.create(name: 'Jhon', photo: 'Link to a photo', bio: 'Lorem ipsum dolor sit amer, consectetur adipiscing ellit. Ut tempor turpis ac venenatis elementum, purus arcu fermentum orci, porta ultrices diam ex ut turpis. Vestibulum in elit sed est vehicula hendrerit. Nullam sit amet suscipit ante. Sed in accumsan lacus.', posts_counter: 2, id: 1)
    end
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
      expect(response.body).to include(@user.name)
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'Jhon', photo: 'Link to a photo', bio: 'Lorem ipsum dolor sit amer, consectetur adipiscing ellit. Ut tempor turpis ac venenatis elementum, purus arcu fermentum orci, porta ultrices diam ex ut turpis. Vestibulum in elit sed est vehicula hendrerit. Nullam sit amet suscipit ante. Sed in accumsan lacus.', posts_counter: 2, id: 1)
      @post = Post.create(title: 'Title', text: 'Body', user_id: 1, id: 1, comments_counter: 1, likes_counter: 1)
    end
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end

    it 'includes the post body in the response' do
      get '/users/1/posts/1'
      expect(response.body).to include(@post.text)
    end
  end
end
