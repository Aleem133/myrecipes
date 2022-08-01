class ChefsController < ApplicationController
    
    def index

    end
    
    def new
        @chef = Chef.new
    end

    def create
        @chef = Chef.new(chef_paramas)
        if @chef.save
            flash[:success] = "Welcome #{@chef.chefname} to MyRecipes App"
            redirect_to chef_path(@chef)
        else
            render "new"
        end
    end

    def show
        @chef = Chef.find(params[:id])
    end

    def edit
        @chef = Chef.find(params[:id])
    end

    def update
        @chef = Chef.find(params[:id])
        if @chef.update(chef_paramas)
            flash[:success] = "#{@chef.chefname}'s Account updated Succesfully"
            redirect_to chef_path(@chef)
        else
            render "edit"
        end
    end
    
    private

    def chef_paramas
       params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
    end
end 