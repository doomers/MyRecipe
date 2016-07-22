class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
    	t.boolean :like
    	t.integer :chef_id, :recipe_id
    end
  end
end
