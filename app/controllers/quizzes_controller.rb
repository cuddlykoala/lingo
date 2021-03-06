class QuizzesController < ApplicationController
  before_action :set_word_type, only: :progress


  # GET 
  # returns the ( current question || quiz summary if over )
  def progress
    @cards = current_user.daily_cards_for_type(@wordtype)
    @index = params[:index].present? ? params[:index].to_i : 0;
    @currentcard = @cards[@index]
    @index = @index + 1;
    @total = @cards.length;
  end

  def submit_response
    @response = params[:response]
    @index = params[:index].to_i
    @word_type_id = params[:word_type_id]
    @cards = current_user.daily_cards_for_type(WordType.find(@word_type_id));
    @currentcard = @cards[@index]

    if !@currentcard.nil?
      if @currentcard.is_correct?(params[:response])
        @currentcard.increment_score
      else
        @currentcard.decrement_score
      end
    end

    redirect_to progress_quiz_path(index: @index, word_type_id: @word_type_id)
  end


  private 
 
  def set_word_type
    @wordtype = WordType.find(params[:word_type_id])
  end
end
