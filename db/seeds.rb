require 'net/http'
require 'json'


Cocktail.create(name: 'Bloody Mary')
Ingredient.create(name: 'Vodka')
Ingredient.create(name: 'Lemon Juice')
Ingredient.create(name: 'Tomato Juice')
Dose.create(description: '3 parts', cocktail_id: 1, ingredient_id: 1)
Dose.create(description: '1 part', cocktail_id: 1, ingredient_id: 2)
Dose.create(description: '6 parts', cocktail_id: 1, ingredient_id: 3)

require 'net/http'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
uri = URI(url)
response = Net::HTTP.get(uri)
drinks_object = JSON.parse(response)
arr_drink = drinks_object['drinks']
arr_drink.each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end
