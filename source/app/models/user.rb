class User < ActiveRecord::Base
  has_many :karma_points, :select => 'kp_count, full_name, username, email'

  attr_accessible :first_name, :last_name, :email, :username, :kp_count

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    #self.joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
    self.where("kp_count IS NOT NULL").order("kp_count DESC")
  end


  def total_karma
    self.karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.get_top_kp_counts(users = User.all)
    users.all[0..num].each do |user|
      user.update_attributes(kp_count: user.total_karma)
    end
  end
end
