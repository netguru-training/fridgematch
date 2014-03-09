class NutritronixFetcher

  def get_from_api(name)
    app_id = 'e80f9aa5'
    app_key = 'b72a672f9df789b608e73f32334957c1'
    JSON.parse(Net::HTTP.get_response("api.nutritionix.com","/v1_1/search/#{URI::encode(name)}?fields=item_name%2Cnf_total_carbohydrate%2Cnf_total_fat%2Cnf_protein%2Cnf_calories&appId=#{app_id}&appKey=#{app_key}").body)
  end

  def parse(name)
    body = get_from_api(name)["hits"].first['fields']
    unit = body["item_name"].split(" - ")[1]
    body["unit"] = unit
    body['item_name'] = body["item_name"].split(" - ")[0]
    { name: body['item_name'], calories: body['nf_calories'], fat: body['nf_total_fat'], carbohydrates: body['nf_total_carbohydrate'], protein: body['nf_protein'], unit: body['unit'] }
  end

  def fetch(ingredient)
    nutritional_value = NutritionalValue.new(self.parse(ingredient.name).merge({ingredient: ingredient}))
    if nutritional_value.save
      puts "Nutritional Value for #{ingredient.name} fetched successfully"
    else
      puts nutritional_value.errors
    end
  end
end