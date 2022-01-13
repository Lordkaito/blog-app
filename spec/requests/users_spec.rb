require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'renders the show template' do
      get '/users/show'
      expect(response).to render_template('show')
    end

    it 'includes the post title in the response' do
      get '/users'
      expect(response.body).to include('Users#index')
    end

    it 'includes the post body in the response' do
      get '/users/show'
      expect(response.body).to include('Show#index in users')
    end
  end
end
