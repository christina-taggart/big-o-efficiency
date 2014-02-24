class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user
  after_save :update_total_karma

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  def update_total_karma
    self.user.update_attributes(total_karma: self.user.total_karma + self.value)
  end
end
