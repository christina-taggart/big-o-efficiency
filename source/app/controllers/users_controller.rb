class UsersController < ApplicationController
  def index
    # users = User.by_karma.readonly(false).first(50)
    # User.get_all_kp_counts(users)
    @users = User.by_karma.first(50)

  end
end
