class UsersController < ApplicationController
	before_filter :require_login, :only=>[:update]
	def new
		@user = User.new
	end

	def create
		u =params.require(:user).permit(:username,:email,:password,:password_confirmation, :firstname, :lastname)

		@user = User.new(u)
		if @user.save
			redirect_to root_url, :notice =>"sign-up"
		else
			render :new
		end
	end

	def update
		id = current_user.id
		
		unless id.to_s == params[:id]
			flash[:danger] ="Invalid operation, you are not authorized to change profile for this user"
			redirect_to "/candidate#profile" and return
		end

		u =params.permit(:username,:email,:password,:new_password, :password_confirmation, :firstname, :lastname, :avatar)
		current_user.email=params[:email]
		current_user.firstname= params[:firstname]
		current_user.lastname = params[:lastname]
		current_user.avatar = params[:avatar] unless params[:avatar].blank?
		
		unless u[:new_password].blank?
			unless User.authenticate(current_user.username, u[:password])
				flash[:danger] ="Old password isn't valid"
				redirect_to "/candidate#profile" and return
			end
			current_user.password= params[:new_password]
			current_user.password_confirmation = params[:password_confirmation]
		end

		if (current_user.save) 
			flash[:success] ="profile has been updated successfully"
		else 
			flash[:danger]=current_user.formatted_errors 
		end


		redirect_to "/candidate#profile"
	end
end
