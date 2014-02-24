class UsersController < ApplicationController
  def index
    @users = User.by_karma
  end
end
