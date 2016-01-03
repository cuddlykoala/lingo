class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :user_langs

  belongs_to :primary_language,
  			class_name: "Language",
  			foreign_key: :primary_language_id

  has_many :user_languages

  has_many :languages,
  			through: :user_languages

  has_many :cards

  has_many :words,
  			through: :cards

  before_save :update_languages

  def daily_cards
  	Card.daily(self)
  end

  def weekly_cards
  	Card.weekly(self)
  end

  def monthly_cards
  	Card.monthly(self)
  end

  def cards_for_type(type)
    cs = []
    self.cards.each do |c|
      if c.word.word_type == type
        cs << c
      end
    end
    return cs
  end

  def cards_for_frequency_type(freq, type)
  	send("#{freq}_cards_for_type", type)
  end

  def daily_cards_for_type(type)
  	cards = []
  	self.daily_cards.each do |c|
  		if c.word.word_type == type
  			cards << c
  		end
  	end
  	return cards
  end

  def weekly_cards_for_type(type)
  	cards = []
  	self.weekly_cards.each do |c|
  		if c.word.word_type == type
  			cards << c
  		end
  	end
  	return cards
  end

  def monthly_cards_for_type(type)
  	cards = []
  	self.monthly_cards.each do |c|
  		if c.word.word_type == type
  			cards << c
  		end
  	end
  	return cards
  end

  private

  def update_languages
    unless user_langs.nil?
      user_langs.each do |l|
        self.user_languages.find_or_create_by(language_id: l)
      end
    end
  end

end