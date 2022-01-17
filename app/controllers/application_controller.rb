class ApplicationController < ActionController::Base
  def current_user_
    User.first
  end
end
