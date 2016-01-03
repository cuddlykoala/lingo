class UserLanguagesController < ApplicationController
	before_filter :authenticate_user!
	before_action :find_language

	def create
		@user_language = current_user.user_languages.new(language: @language)
		@user_language.save
	end

	private

	def find_language
		@language = Language.find(params[:language_id])
	end
end