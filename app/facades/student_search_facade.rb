class StudentSearchFacade
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def students_count
    # conn = Faraday.new("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?api_key=alohamora") do |f|
    #   f.adapter Faraday.default_adapter
    # end
    # response = conn.get
    # results = JSON.parse(response.body, symbolize_headers: true)
    # binding.pry
    results = service_request(@house)
    # binding.pry
    # student_results = results["data"].first["attributes"]["students"]
    # student_results.count
    results.count
  end

  def students
    # conn = Faraday.new("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}?api_key=#{ENV['hogwarts']}") do |f|
    #   f.adapter Faraday.default_adapter
    # end
    # response = conn.get
    # results = JSON.parse(response.body, symbolize_headers: true)
    # binding.pry
    results = service_request(@house)
    # student_results = results["data"].first["attributes"]["students"]
    student_list = results.map do |result|
      # binding.pry
      Student.new(result)
    end
    student_list
  end

  def service_request(house)
    @results ||= HogwartsService.new.get_results(house)
  end

end
