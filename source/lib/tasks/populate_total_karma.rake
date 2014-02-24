namespace :user do
  desc "calculates total_karma of all users"
  task :karma => :environment do
    User.all.each do |user|
      user.update_attribute :total_karma, user.karma_points.sum(:value)
      puts "User #{user.id}, total karma: #{user.total_karma}"
    end
  end
end