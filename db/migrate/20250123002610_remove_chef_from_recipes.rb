class RemoveChefFromRecipes < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipes, :chef, :string
  end
end
