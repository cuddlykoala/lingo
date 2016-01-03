class Word < ActiveRecord::Base
  belongs_to :word_type

  has_many :cards

  validates :name,
  			presence: :true,
  			uniqueness: {
  				scope: :word_type
  			}

  validates :translation,
  			presence: true

  validates :word_type,
  			presence: true

  attr_accessor :user

  private


  def check_prop(prop)
  	if (prop == "1")
  		true
  	else
  		false
  	end
  end
end
