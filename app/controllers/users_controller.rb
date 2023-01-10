class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_login, except: [:show, :index, :new, :create]
    before_action :loginuser_same, only: [:edit]

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
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
        session[:user_id] = @user.id 
        flash[:notice] = "#{@user.username} !! Welcome to alpha blog."
        redirect_to articles_path
        else                        
        render 'new'
        end    
    end

    def destroy
        if @user.id === session[:user_id]
            session[:user_id] = nil
            end
        @user.destroy
        
        flash[:notice] = "User and all his articles deleted successfully."
        redirect_to root_path
    end    
    
    private

    def set_user
        @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound =>e 
        flash[:alert] = 'User not found'
        redirect_to root_path
    end    

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end    

    def loginuser_same
        if  current_user.id != @user.id
        flash[:alert] = 'Not permitted action'
           redirect_to root_path
        end
   end 
end