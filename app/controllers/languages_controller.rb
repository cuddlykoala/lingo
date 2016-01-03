class LanguagesController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_language, only: [:show]
  def index
  	@languages = Language.all
  end

  def show
  end

  def new
  	@language = Language.new
  end

  def create
  	@language = Language.new(language_params)
  end

  private

  def set_language
  	@language = Language.find(params[:id])
  end

  def language_params
  	params.require(:language).permit(:name)
  end
end
