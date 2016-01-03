class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :primary_language,
  			class_name: "Language",
  			foreign_key: :primary_language

  has_many :user_languages

  has_many :learning_languages,
  			through: :user_languages
  			source: :language

  has_many :cards

  has_many :words,
  			through: :cards

  def daily_cards
  	Card.daily(self)
  end

  def weekly_cards
  	Card.weekly(self)
  end

  def monthly_cards
  	Card.monthly(self)
  end

end