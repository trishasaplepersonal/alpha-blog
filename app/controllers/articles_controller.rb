class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_login, except: [:show, :index]
    before_action :loginuser_same, only: [:edit, :destroy]

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
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
        @article.user_id = current_user.id
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
    rescue ActiveRecord::RecordNotFound =>e 
        flash[:alert] = 'Article not found'
        redirect_to root_path
    end    

    def article_params
        params.require(:article).permit(:title, :description)
    end    

    def loginuser_same
         if  current_user.id != @article.user.id
flash[:alert] = 'Not permitted action'
            redirect_to root_path
         end
    end        
        
end