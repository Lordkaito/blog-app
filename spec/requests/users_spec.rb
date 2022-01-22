require 'rails_helper'

RSpec.describe 'Users', type: :request do
  subject { User.new(name: 'Jhon', photo: 'Link to a photo', bio: 'text', posts_counter: 2) }
  before { subject.save }
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it "The template it's not empty" do
      get '/users'
      expect(response.body).not_to be_empty
    end
  end

  describe 'GET /users/1' do
    it 'returns http success' do
      get '/users/1'
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get '/users/1'
      expect(response).to render_template('show')
    end

    it 'includes the post body in the response' do
      get '/users/1'
      expect(response.body).to include('Jhon')
    end
  end
end
