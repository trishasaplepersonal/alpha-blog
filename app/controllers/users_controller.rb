class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end
    def show
        @articles = @user.articles
    end   
    def new
        @user = User.new
    end    

    def edit
                     
    end
    def update        
        #white listing the params
        if @user.update(user_params)
            flash[:notice] = "User updated successfully"
            redirect_to @user
        else
            render 'edit'    
        end    
    end        

    def create
        #white listing the params
        @user = User.new(user_params)                        
        if @user.save            
        flash[:notice] = "#{@user.username} !! Welcome to alpha blog."
        redirect_to articles_path
        else                        
        render 'new'
        end    
    end
    
    private

    def set_user
        @user = User.find(params[:id])
    end    

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end    
end