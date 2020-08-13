class ChangeDoseColumnToIngredientColumn < ActiveRecord::Migration[6.0]
  def change
    remove_reference :doses, :dose, foreign_key: true
    add_reference :doses, :ingredient, foreign_key: true
  end
end
