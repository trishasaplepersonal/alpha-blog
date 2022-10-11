class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def index
        @articles = Article.all 
    end

    def show
        
    end    

    def new
        @article = Article.new
    end    

    def edit
                     
    end
    
    def update        
        #white listing the params
        if @article.update(article_params)
            flash[:notice] = "Article updated successfully"
            redirect_to @article
        else
            render 'edit'    
        end    
    end        

    def create
        #white listing the params
        @article = Article.new(article_params)
        if @article.save
        flash[:notice]            = "Article save successfully."
        redirect_to @article
        else            
        render 'new'
        end    
    end    

    def destroy
        # destory doesn't needs to be saved
        @article.destroy
        redirect_to articles_path
    end    

    private

    def set_article
        @article = Article.find(params[:id])
    end    

    def article_params
        params.require(:article).permit(:title, :description)
    end    
        
end