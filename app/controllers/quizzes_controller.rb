class QuizzesController < ApplicationController
  def show
  end

  def verb
  	
  end

  def noun
    @index = params[:index].present? ? params[:index] : 1
  end

  def adjective
  	
  end

  def conjunction

  end
end
