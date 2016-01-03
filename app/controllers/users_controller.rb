class UsersController < ApplicationController
  def show
  	@user = current_user
  end

  def update
  	@user = current_user
  	respond_to do |format|
  	  	if @user.update(user_params)
  			format.html { redirect_to user_path, notice: "User preferences updated." }
  			format.js
  		else
  			format.html { render :new }
  			format.js
	  	end
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:primary_language_id, 
  								 :user_languages_attributes => [:language_id])
  end
end
