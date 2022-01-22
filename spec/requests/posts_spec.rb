require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  subject { User.new(name: 'Jhon', photo: 'Link to a photo', bio: 'text', posts_counter: 2) }
  before { subject.save }
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
