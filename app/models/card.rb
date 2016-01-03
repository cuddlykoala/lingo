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

  private

  def set_default_points
  	self.points = 0
  end

end
