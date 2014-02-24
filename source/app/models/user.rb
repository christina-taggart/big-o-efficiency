class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :total_karma

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

  before_save :calculate_total_karma

  def self.by_karma
    self.order("total_karma DESC").limit(50)
  end

  def calculate_total_karma
    self.total_karma = self.karma_points.sum(:value)
  end

  def increment_total_karma(value)
    self.total_karma += value
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
