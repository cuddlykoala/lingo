class QuizzesController < ApplicationController
  before_action :set_word_type, only: :noun

  def show
  end

  def verb
  end

  def noun
    @cards = current_user.daily_cards_for_type(WordType.find_by(name: "noun"))
    @currentcard = @cards[0]
    @nextcard = @cards[1]
    @index = 1;
    @total = @cards.length;
  end

  def adjective
  end

  def conjunction
  end

  def next_question
    @index = params[:index]
    @answer = params[:answer]

    @cards = current_user.daily_cards_for_type(WordType.find_by(name: "noun"))
  end

  private 
 
  def set_word_type
    @wordtype = WordType.find(params[:word_type_id])
  end
end
