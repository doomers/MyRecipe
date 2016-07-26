class RecipesController < ApplicationController
   before_action :set_recipe, only: [:edit, :update, :show, :like]
   before_action :require_same_user, only: [:edit,:update]
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 3)
  end

  def show
  end

  def new
  	@recipe = Recipe.new
  end

  def create
   @recipe =Recipe.new(recipe_params)
   @recipe.chef = current_user

   if @recipe.save
     flash[:success] = "Your Recipe was Successfully saved!!!"
       redirect_to recipes_path
   else
   	render :new
   end
  end

  def edit
  end

  def update
  		if @recipe.update(recipe_params)
  			flash[:success] = "Your Recipe is Updated Successfully!"
  			redirect_to recipe_path(@recipe)
  			#or either     
  			#redirect_to tecipe_path......it automatically redirect to  that particular recipe_path
  		else
  			render :edit
  		end

  end
  def like
  like=Like.create(like: params[:like],chef: current_user  , recipe: @recipe)
  if like.valid?
    if params[:like]=='true' ?  flash[:success]="Like" : flash[:success]="Dislike"
      redirect_to :back
    end
  else
    flash[:danger]="You Can Only  like/Dislike Only Once."
    redirect_to :back

  end
  end

  private
   def recipe_params
    params.require(:recipe).permit(:name,:summary,:description,:picture)
  end

  def set_recipe
  @recipe =Recipe.find(params[:id])
  end

  def require_same_user
   if current_user != @recipe.chef
    flash[:danger]='You can edit only your recipe'
    redirect_to recipes_path
  end
  end

end