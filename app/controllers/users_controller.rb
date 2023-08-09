class UsersController < ApplicationController
  def index
    @useer = User.all
  end

  def new
    @user = User.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
