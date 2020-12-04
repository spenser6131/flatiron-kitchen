class RecipesController < ApplicationController

  def edit
    grab_recipe
  end
  
  def update
    grab_recipe
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render "edit"
    end
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render "new"
    end
  end

  def show
    grab_recipe
  end

  private

  def grab_recipe
    @recipe = Recipe.find_or_create_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end

end
