class Word < ActiveRecord::Base
  belongs_to :word_type

  belongs_to :primary_language,
  			 class_name: "Language",
  			 foreign_key: :primary_language_id

  belongs_to :translation_language,
  			 class_name: "Language",
  			 foreign_key: :translation_language_id

  has_many :cards

  validates :name,
  			presence: :true,
  			uniqueness: {
  				scope: [:word_type, :translation]
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
