module NutritronixFetch
  def self.parse(name)
    require 'open-uri'
    app_id = 'e80f9aa5'
    app_key = 'b72a672f9df789b608e73f32334957c1'
    response = Net::HTTP.get_response("api.nutritionix.com","/v1_1/search/#{URI::encode(name)}?fields=item_name%2Cnf_total_carbohydrate%2Cnf_total_fat%2Cnf_protein%2Cnf_calories&appId=#{app_id}&appKey=#{app_key}")
    body = JSON.parse(response.body)["hits"].first['fields']
    unit = body["item_name"].split(" - ")[1]
    body["unit"] = unit
    body['item_name'] = body["item_name"].split(" - ")[0]
    body
  end
end
