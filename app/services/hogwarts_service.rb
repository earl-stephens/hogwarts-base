class HogwartsService

  def get_results(selected_house)

    conn = Faraday.new("http://hogwarts-it.herokuapp.com/api/v1/house/#{selected_house}?api_key=alohamora") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get
    results = JSON.parse(response.body, symbolize_headers: true)
    results
  end
end
