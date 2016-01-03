class WordsController < ApplicationController
  def index
  	@words = Word.all.group_by(&:word_type)
  end

  def show
  	@word = Word.find(params[:id])
  end
end
