class SessionController < ApplicationController

def login
    
end

def logout
    session[:user_id] = nil
    redirect_to root_path
end

def authenticate
    @user = User.find_by(email: params[:session] [:email])
    if @user && @user.authenticate(params[:session] [:password])
        flash[:notice] = "you logged in successfully"
        session[:user_id] = @user
        redirect_to @user
    else
        flash.now[:alert] = "something is wrong"
        render 'login'
    end

end    

end