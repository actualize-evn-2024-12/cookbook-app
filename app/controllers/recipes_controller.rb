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
      title: "chicken salad", 
      ingredients: "chicken + lettuce", 
      directions: "mix all ingredients together", 
      prep_time: 20, 
      chef: "brian",
      image_url: "https://www.cookingclassy.com/wp-content/uploads/2024/05/grilled-chicken-salad-02.jpg"
    )
    @recipe.save
    render :show
  end
end
