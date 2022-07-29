class RecipesController < ApplicationController

    def index
        @recipes =Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])

    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = Chef.first
        if @recipe.save
            flash[:success]= "Recepie was Created Succesfully"
            redirect_to recipe_path(@recipe)
        else
            render 'new'
        end
    end

    def edit

    end

    def update

    end

    private
    
    def recipe_params
        params.require(:recipe).permit(:name, :description)
    end
    
end