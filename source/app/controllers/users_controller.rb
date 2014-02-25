class UsersController < ApplicationController
  def index
    @users = User.by_karma(50)
  end
end
