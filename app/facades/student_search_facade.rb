class StudentSearchFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def students
    conn = Faraday.new("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?api_key=alohamora") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get
    results = JSON.parse(response.body, symbolize_headers: true)
    # binding.pry
    student_results = results["data"].first["attributes"]["students"]
    student_list = student_results.map do |result|
      Student.new(result)
    end
    student_list
  end

end
