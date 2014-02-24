class UsersController < ApplicationController
  def index
    @users = User.top_karma(50)
  end
end
