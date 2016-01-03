class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
