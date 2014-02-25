
namespace :db do
  desc "Populates column 'total_karma' in users table"
  task :populate_total_karma => :environment do
    sql = "SELECT users.id, SUM(karma_points.value) FROM users JOIN karma_points on karma_points.user_id = users.id GROUP BY users.id;"
    records = ActiveRecord::Base.connection.execute(sql)
    records.each do |record|
      User.find(record["id"]).update_attribute("total_karma", record["sum"])
    end
  end
end









#
# SELECT users.id, SUM(karma_points.value) FROM users JOIN karma_points on karma_points.user_id = users.id GROUP BY users.id;

# User.select('SUM(karma_points.value)').joins(:karma_points).group('users.id').limit(2)



#   self.karma_points.sum(:value)