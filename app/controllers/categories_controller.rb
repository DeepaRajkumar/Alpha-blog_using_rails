class CategoriesController < ApplicationController
	before_action :get_article, only:[:show,:update]
	def index
		#@category=Category.paginate(page: params[:page], per_page: 5)
	end                                                                             
	def show
		#@category=Article.find(params[:id])
	end	
	
	def new
		@category=Category.new
	end 
	def index
		@category=Category.all
	end	
	def edit
		@category=Category.find(params[:id])
    end 
    def update
    	@category=Category.find(params[:id])
    	if @category.update(get_param)
    		flash[:notice]="Successfully updated the article"
    		redirect_to articles_path
    	else
    	   render 'edit'
    	end 
    end		

	def create
		@category=Category.new(get_param)
		#@article.save
		if @category.save
			flash[:notice]="Sucessfully Created the article"
			redirect_to new_category_path(@article)
	    else
	    render 'new'
	    end		
	end 
   
    private
    def get_article
        @category=Category.find(params[:id])
    end 
    def get_param
        params.require(:category).permit(:name)
    end        	
end
