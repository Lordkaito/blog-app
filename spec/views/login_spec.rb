require 'rails_helper'

RSpec.describe 'Login page', type: :system do
    
    
    it 'Page should have a login form' do
      visit new_user_session_path
      expect(page.has_field?('Email')).to be true
      expect(page.has_field?('Password')).to be true
      expect(page.has_button?('Log in')).to be true
    end
  end