require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    # response = HTTP.get("http://localhost:3000/recipes.json")
    get "/recipes.json"
    data = JSON.parse(response.body)
    assert_equal Recipe.count, data.length
    assert_response 200
  end

  test "create" do
    assert_difference "Recipe.count", 1 do
      post "/recipes.json", params: { title: "Cake", chef: "Peter", image_url: "test.jpg", prep_time: 10, ingredients: "Batter", directions: "Bake" }
      assert_response 200
    end
  end

  test "show" do
    get "/recipes/#{Recipe.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "chef", "ingredients", "directions", "image_url", "prep_time", "created_at", "updated_at"], data.keys
  end

  test "update" do
    recipe = Recipe.first
    patch "/recipes/#{recipe.id}.json", params: { title: "Updated title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end

  # test/controllers/recipes_controller_test.rb
  test "destroy" do
    assert_difference "Recipe.count", -1 do
      delete "/recipes/#{Recipe.first.id}.json"
      assert_response 200
    end
  end
end



# it won't make silly mistakes
# it is fast/automatable