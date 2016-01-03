class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def word_types
  	if user_signed_in?
  		@word_types = WordType.all
  	end
  end

  helper_method :word_types

  def set_word_type
  	@word_type = WordType.find(params[:word_type_id])
  end

  helper_method :set_word_type
end
