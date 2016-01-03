class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :word

  attr_accessor :name, :translation, :word_type

  validates :word,
  			presence: true,
  			uniqueness: {
  				scope: :user
  			}

  validates :user,
  			presence: true

  before_create :set_default_points
  before_validation :check_word

  scope :between_points, ->(min, max) {
  	where(points: min..max)
  }

  def self.daily(user)
  	self.between_points(0, 12).where(user: user)
  end

  def self.weekly(user)
  	self.between_points(13, 24).where(user: user)
  end

  def self.monthly(user)
  	self.between_points(25, 100).where(user: user)
  end

  def increment_score
  	self.points = points + 3
  	self.save!
  end

  private

  def set_default_points
  	self.points = 0
  end

  def check_word
  	if Word.exists?(name: name, translation: translation, word_type_id: word_type)
  		return
  	else
  		w = Word.new(name: name, translation: translation, word_type_id: word_type)
  		w.save!
  		self.word_id = w.id
  	end
  end

end
