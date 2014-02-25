class User < ActiveRecord::Base
  attr_accessible :total_karma

  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username

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

  def self.by_karma(num_of_records=1)
    User.find(:all, :order => "total_karma DESC", :limit => num_of_records)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
