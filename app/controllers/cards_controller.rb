class CardsController < ApplicationController
	before_filter :authenticate_user!
  def index
  	@cards = current_user.cards
  end

  def new 
  	@card = Card.new
  end

  def create
  end
end
