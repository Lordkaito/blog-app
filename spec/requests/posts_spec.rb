require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'returns http success' do
      get '/users/index/posts'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users/index/posts'
      expect(response).to render_template('index')
    end

    it 'includes the post title in the response' do
      get '/users/index/posts'
      expect(response.body).to include('Posts#index')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/index/posts/show'
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get '/users/index/posts/show'
      expect(response).to render_template('show')
    end

    it 'includes the post body in the response' do
      get '/users/index/posts/show'
      expect(response.body).to include('Posts#show')
    end
  end
end
