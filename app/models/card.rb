class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :word

  attr_accessor :name, :translation, :word_type, :primary_language, :translation_language

  validates :word,
  			presence: true,
  			uniqueness: {
  				scope: :user
  			}

  validates :user,
  			presence: true

  before_create :set_default_points
  before_create :check_word

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

  def decrement_score
    if points < 3
      self.points = 0
    else
      self.points = points - 3
    end
    self.save!
  end

  def is_correct?(response)
    if word.translation.downcase == response.downcase
      return true
    else
      return false
    end
  end

  private

  def set_default_points
  	self.points = 0
  end

  def check_word
  	if Word.exists?(name: name, translation: translation, 
  					word_type_id: word_type, primary_language_id: primary_language, 
  					translation_language_id: translation_language)
  		return
  	else
  		w = Word.new(name: name, translation: translation, 
  						word_type_id: word_type, primary_language_id: primary_language, 
  						translation_language_id: translation_language)
  		w.save!
  		self.word_id = w.id
  	end
  end

end
