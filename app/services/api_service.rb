class ApiService
  def get_data(endpoint)
    response = Faraday.new(endpoint)
  end

  def parsed(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
