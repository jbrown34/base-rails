class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :user_id
      t.integer :prep_duration
      t.string :cook_duration
      t.string :main_ingredient
      t.string :ingredient2
      t.string :description

      t.timestamps
    end
  end
end
