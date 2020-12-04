class IngredientsController < ApplicationController
  
  def edit
    grab_ingredient
  end
  
  def update
    grab_ingredient
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render :edit
    end
  end
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  private

  def grab_ingredient
    @ingredient = Ingredient.find_or_create_by(id: params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
