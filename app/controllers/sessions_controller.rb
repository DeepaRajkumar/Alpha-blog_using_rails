class SessionsController < ApplicationController
	def new
	end	
	def create
		user=Customer.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:customer_id]=user.id
			flash[:notice]="Sucessfully logged in."
			redirect_to customers_path
        else
        	flash.now[:alert]="wrongly logged in"
        	redirect_to login_path
        end	

	end	
	def destroy
		session[:customer_id]=nil
		flash[:notice]="logged out Sucessfully"
		redirect_to login_path
	end	

end
