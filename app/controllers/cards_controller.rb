class CardsController < ApplicationController
	before_filter :authenticate_user!
  def index
  	@cards = current_user.cards
  end

  def new
  	@card = Card.new
  end

  def create
  	@card = Card.new(card_params)
  	@card.user = current_user
  	respond_to do |f|
  		if @card.save
  			f.html {redirect_to cards_path, notice: "#{@card.word} card saved to your weekly pile!"}
  			f.js
	  	else
	  		f.html { render :new }
	  		f.js
	  	end
		end
  end

  private

  def card_params
  	params.require(:card).permit(:name, :translation, :word_type, :user, :primary_language, :translation_language)
  end
end
