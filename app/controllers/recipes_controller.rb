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
    p current_user

    @recipe = Recipe.new(
      title: params[:title], 
      ingredients: params[:ingredients], 
      directions: params[:directions], 
      prep_time: params[:prep_time], 
      image_url: params[:image_url],
      user_id: current_user.id
    )
    @recipe.save
    render :show
  end

  def update
    # what code do i need here?
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.title = params[:title] || @recipe.title    
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.image_url = params[:image_url] || @recipe.image_url
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.save
    render :show
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy
    render json: {messsage: "Recipe has been removed"}
  end
end
