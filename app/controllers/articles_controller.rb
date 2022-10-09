class ArticlesController < ApplicationController
	before_action :get_article, only:[:show,:edit,:update,:destroy]
	def index
		@article=Article.paginate(page: params[:page], per_page: 5)
	end
	def home
	end 
	def show
		#@article=Article.find(params[:id])
	end	
	def about
	end	
	def new
		@article=Article.new
	end 
	def edit
		#@article=Article.find(params[:id])
	end	
	def create
		@article=Article.new(get_param)
		#@article.save
		@article.customer=Customer.find(session[:customer_id])
		#render plain: @article.inspect
		if @article.save
			flash[:notice]="Sucessfully Created the article"
			redirect_to article_path(@article)
	    else
	    render 'new'
	    end		
	end 
    def update
    	#@article=Article.find(params[:id])
    	if @article.update(get_param)
    		flash[:notice]="Successfully updated the article"
    		redirect_to article_path(@article)
    	else
    	   render 'edit'
    	end 
    end	
    def destroy
       	#@article=Article.find(params[:id])
       	@article.destroy
       	redirect_to root_path
    end
    private
    def get_article
        @article=Article.find(params[:id])
    end 
    def get_param
        params.require(:article).permit(:title,:description,category_ids:[])
    end  
    def search 
    	if params[:result].present?
    		@result=Article.search(params[:result])
    		put(params[:result])
            if @result 
            	 flash[:notice]=" some valid keyword:"
            	 render 'articles/search'
            else
        	   flash[:alert]="Kindly provide some valid keyword:"
               render 'articles/search'
            end
        else
           flash[:alert]="Kindly provide some keyword name:"
           render 'articles/search'
        end
    end           	
end
