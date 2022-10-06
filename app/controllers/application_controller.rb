class ApplicationController < ActionController::Base
 helper_method :current_user,:logged_in	
 def current_user
		if session[:customer_id]
		      Customer.find(session[:customer_id])
		end 
    end 
    def logged_in
    	!!current_user

    end		      
		
 
end
