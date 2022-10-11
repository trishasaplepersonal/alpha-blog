class ArticlesController < ApplicationController

    def index
        @articles = Article.all 
    end

    def show
        @article = Article.find(params["id"])
    end    

    def new
        @article = Article.new
    end    

    def edit
        @article = Article.find(params[:id])                
    end
    
    def update
        @article = Article.find(params[:id])
        #white listing the params
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article updated successfully"
            redirect_to @article
        else
            render 'edit'    
        end    
    end        

    def create
        #white listing the params
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
        flash[:notice]            = "Article save successfully."
        redirect_to @article
        else            
        render 'new'
        end    
    end    

    def destroy        
        @article = Article.find(params[:id])
        # destory doesn't needs to be saved
        @article.destroy
        redirect_to articles_path
    end    
        
end