class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       flash[:notice] = 'User was successfully created.'
  #       format.html { redirect_to @user }
  #     else
  #       format.html { render :new }
  #     end
  #   end
  # end
end
