namespace :db do
  desc "Assign total karma points to each user"
  task :total_karma_points => :environment do
    users = User.all
    users.each do |user|
      user.update_attribute('total_karma_points', user.total_karma)
    end
  end

end
