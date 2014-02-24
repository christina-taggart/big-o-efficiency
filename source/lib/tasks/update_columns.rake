namespace :update_columns do
  desc "TODO"
  #1. loop through all of our users in batches
  #2. update the user's total_karma with karma_points.sum(:value) without runing validations or callbacks (hint: update_attribute)
  task :update => :environment do
    User.find_each do |user|
        user.update_attribute(:total_points, user.karma_points.sum(:value))
      p "This is user number" + user.id.to_s
      p "They're points now equal " + user.total_points.to_s
    end
  end
end
