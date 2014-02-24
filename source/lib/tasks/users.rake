namespace :users do
  desc "Set user total_karma"
  task :set_total_karma => :environment do
    User.all.each do |user|
      user.update_attribute :total_karma, user.karma_points.sum(:value)
      puts "#{user.id} - #{user.total_karma}"
    end

  end

end
