class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index
  end

  def show
    @recipe = Recipe.find_by(id: 3)
    render :show
  end
end
