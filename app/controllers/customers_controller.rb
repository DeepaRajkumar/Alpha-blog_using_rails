class CustomersController < ApplicationController
    def index
		@user=Customer.paginate(page: params[:page], per_page: 5)
	end	
	def show
		@user=Customer.find(params[:id])
		@article=@user.articles
	end	
	def new
		@user=Customer.new
	end
	def create
		@user=Customer.new(get_param)
		#@article.save
		#@article.customer=Customer.first
		#render plain: @article.inspect
		if @user.save
			flash[:notice]="Sucessfully Created the article"
			redirect_to articles_path
	    else
	    render 'new'
	    end	
	end    	
    def edit
       @user=Customer.find(params[:id])
    end 
    def update
    	#@article=Article.find(params[:id])
    	@user=Customer.find(params[:id])
    	if @user.update(get_param)
    		flash[:notice]="Successfully updated the article"
    		redirect_to articles_path
    	else
    	   render 'edit'
    	end 
    end	
    def get_article
        
    end    		 
	def get_param
        params.require(:customer).permit(:username,:email,:password)
    end  
end		