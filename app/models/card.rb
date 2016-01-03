class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :word

  validates :word,
  			presence: true,
  			uniqueness: {
  				scope: :user
  			}

  validates :user,
  			presence: true

  before_create :set_default_points

  scope :between_points, ->(min, max) {
  	where(points: min..max)
  }

  def self.daily(user)
  	self.between_points(0, 12).where(user: user)
  end

  def self.weekly(user)
  	self.between_points(12, 24).where(user: user)
  end

  def self.monthly(user)
  	self.between_points(24, 100).where(user: user)
  end

  def increment_score
  	points += 3
  end

  private

  def set_default_points
  	self.points = 0
  end

end
