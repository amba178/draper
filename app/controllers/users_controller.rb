class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = UserDecorator.find(params[:id])
  end

  def edit
  end

  def new
  end
end
