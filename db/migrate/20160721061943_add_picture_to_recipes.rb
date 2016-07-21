class AddPictureToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :picture, :string
  end
end
