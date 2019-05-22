class HogwartsService

  def get_results(selected_house)
    house_id = get_house_id(selected_house)
    # binding.pry
    # conn = Faraday.new("https://hogwarts-as-a-service.herokuapp.com/api/v1/house/#{house_id}") do |f|
    #   f.headers['x_api_key'] = ENV['HaaS_key']
    #   f.adapter Faraday.default_adapter
    # end
    # binding.pry
    # response = conn.get("/api/v1/house/#{house_id}")
    # results = JSON.parse(response.body, symbolize_headers: true)
# binding.pry
    results = api_results("/api/v1/house/#{house_id}")
    # binding.pry
    results
  end

  def get_house_id(selected_house)
    # response = conn.get
    # results = JSON.parse(response.body, symbolize_headers: true)
    house_id = 0
    api_results.each do |result|
      if result["name"] == selected_house
        house_id = result["id"]
      end
    end
    house_id
    # binding.pry
  end

  def conn
    conn = Faraday.new("https://hogwarts-as-a-service.herokuapp.com/api/v1/house") do |f|
      f.headers['x_api_key'] = ENV['HaaS_key']
      f.adapter Faraday.default_adapter
    end
  end

  def api_results(url = nil)
    response = conn.get(url)
    results = JSON.parse(response.body, symbolize_headers: true)
# binding.pry
  end
end
