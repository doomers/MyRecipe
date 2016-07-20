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
    binding.pry
  end

end