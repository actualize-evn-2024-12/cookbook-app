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

  def create
    # how do i make a new recipe in a controller?
    @recipe = Recipe.new(
      title: params[:title], 
      ingredients: params[:ingredients], 
      directions: params[:directions], 
      prep_time: params[:prep_time], 
      chef: params[:chef],
      image_url: params[:image_url]
    )
    @recipe.save
    render :show
  end
end
