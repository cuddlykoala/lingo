class CardsController < ApplicationController
	before_filter :authenticate_user!
  before_action :set_word_type, only: :by_word_type
  def index
  	@cards = current_user.cards
  end

  def new
  	@card = Card.new
    @word_type = params[:word_type_id].present? ? WordType.find(params[:word_type_id]) : nil
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

  def by_word_type
    @cards = current_user.cards_for_type(@word_type)
    render :template => 'cards/index'
  end

  private

  def card_params
  	params.require(:card).permit(:name, :translation, :word_type, :user, :primary_language, :translation_language)
  end
end
