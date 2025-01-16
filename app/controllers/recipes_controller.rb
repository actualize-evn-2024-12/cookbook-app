class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index
  end

  def show
    the_id = params[:id]    
    @recipe = Recipe.find_by(id: the_id)
    render :show
  end
end
