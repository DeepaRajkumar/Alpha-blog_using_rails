class CommentsController < ApplicationController
  def index
  end 
  def new
   @article = Article.find(params[:id])
    @comment = @article.comments.create(comment_params)
  end  
	def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.save
    redirect_to article_path(@article)
  end
   def update
    	 @comment = @article.comments.create(comment_params)
    	if @comment.update(comment_params)
    		flash[:notice]="Successfully updated the article"
    		redirect_to article_path(@article)
    	else
    	   render 'edit'
    	end 
  end
  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.build
  end 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end 

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
   
    end
end