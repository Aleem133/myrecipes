class IngredientsController < ApplicationController

    before_action :set_ingredient, only: [:show, :edit, :update]
    before_action :require_admin, except: [:show,:index]

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_paramas)
        if @ingredient.save
            session[:ingredient_id] = @ingredient.id
            flash[:success] = "Ingredient Created Successfully"
            redirect_to ingredient_path(@ingredient)
        else
            render "new"
        end
    end

    def edit

    end

    def update
        if @ingredient.update(ingredient_paramas)
            session[:ingredient_id] = @ingredient.id
            flash[:success] = "Ingredient name updated successfully"
            redirect_to ingredient_path(@ingredient)
        else
            render "new"
        end
    end

    def show
        @ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
    end

    def index
        @ingredients = Ingredient.paginate(page: params[:page],per_page: 5)
    end


    private
    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_paramas
        params.require(:ingredient).permit(:name)
    end

    def require_admin
        if !logged_in? ||(logged_in? && !current_chef.admin?)
            flash[:danger] = "Only admin users can perform that action"
            redirect_to ingredients _path
        end
    end

end
