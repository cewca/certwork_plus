class SessionsController < ApplicationController
	def create
	  user = login(params[:username], params[:password], params[:remember_me])
	  if user
	  	
	    redirect_back_or_to candidate_index_path
	  else
	    flash.now.alert = "Username or password was invalid"
	    render :new
	  end
	end

	def destroy
	  logout
	  redirect_to root_url, :notice => "Logged out!"
	end
end

