class ChefsController < ApplicationController
    
    before_action :set_chef, only: [:show, :edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_admin, only: [:destroy]

    def index
        @chefs = Chef.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @chef = Chef.new
    end

    def create
        @chef = Chef.new(chef_paramas)
        if @chef.save
            session[:chef_id] = @chef.id
            flash[:success] = "Welcome #{@chef.chefname} to MyRecipes App"
            redirect_to chef_path(@chef)
        else
            render "new"
        end
    end

    def show
        @chef_recipes = @chef.recipes.paginate(page: params[:page], per_page: 5)
    end

    def edit
        @chef = Chef.find(params[:id])
    end

    def update
        if @chef.update(chef_paramas)
            flash[:success] = "#{@chef.chefname}'s Account updated Succesfully"
            redirect_to chef_path(@chef)
        else
            render "edit"
        end
    end
    
    def destroy
        if !@chef.admin? 
            @chef.destroy
            flash[:danger] = "Chef and all associated reipes have been deleted..!"
            redirect_to chefs_path
        end
        
    end

    private

    def set_chef
        @chef = Chef.find(params[:id])
    end

    def require_same_user
        if current_chef != @chef && !current_chef.admin?
            flash[:danger]="You can only edit/delete your own account"
            redirect_to chefs_path
        end
    end

    def chef_paramas
       params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
    end

    def require_admin
        if logged_in? && !current_chef.admin?
            flash[:danger] = "Only admin users can perform that action"
            redirect_to root_path
        end
    end
end 