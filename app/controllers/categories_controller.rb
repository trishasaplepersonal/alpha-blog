class CategoriesController < ApplicationController

    before_action :admin_login, except: [:index, :show]
    before_action :set_category, except: [:index, :create, :new]

    def show
        
    end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @category = Category.new()
    end

    def edit
        
    end

    def create
        @category = Category.new(categories_params)        
        if @category.save
        flash[:notice] = 'Category created successfully'
        redirect_to @category
        else
            render 'new'
        end
    end

    def update        
        if @category.update(categories_params)
        flash[:notice] = 'Category updated successfully'
        redirect_to @category
        else
            render 'new'
        end
    end

    def destroy        
        @category.destroy
        flash[:notice] = 'Category deleted successfully'
        redirect_to categories_path
    end

    private

    def categories_params
        params.require(:category).permit(:name, :description)
    end

    def set_category
    @category = Category.find(params[:id])
    rescue  ActiveRecord::RecordNotFound =>e 
     flash[:alert] = 'Category not found'
     redirect_to root_path
    end

    def admin_login
        if !(logged_in? && current_user.admin) 
            flash[:alert] = 'Only admins are permitted for this action'
            redirect_to categories_path
        end
    end    
end