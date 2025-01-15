class RecipesController < ApplicationController
  def first
    # get some data from the db and show it to the user
    recipe = Recipe.find_by(id: 3)    
    render json: {
      id: recipe.id,
      title: recipe.title,
      ingredients: recipe.ingredients,
      directions: recipe.directions,
      prep_time: recipe.prep_time,
      image_url: recipe.image_url,

    }
  end
end
