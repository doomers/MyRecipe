class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end

  def show
   @recipe = Recipe.find(params[:id])
  end

  def new
  	@recipe = Recipe.new
  end

  def create
   @recipe =Recipe.new(recipe_params)
   @recipe.chef = Chef.find(2)

   if @recipe.save
     flash[:success] = "Your Recipe was Successfully saved!!!"
       redirect_to recipes_path
   else
   	render :new
   end
  end

  private def recipe_params
    params.require(:recipe).permit(:name,:summary,:description)
  end


end