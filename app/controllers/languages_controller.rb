class LanguagesController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_language, only: [:show]
  def index
  	@languages = Language.all
  end

  def show
  	@popular_words = @language.words
  end

  def new
  	@language = Language.new
  end

  def create
  	@language = Language.new(language_params)
  	if @language.save
  		redirect_to languages_path, notice: "Language created"
  	else
  		render :new
  	end
  end

  private

  def set_language
  	@language = Language.find(params[:id])
  end

  def language_params
  	params.require(:language).permit(:name)
  end
end
