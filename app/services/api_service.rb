class ApiService
  def get_data(endpoint)
    response = Faraday.new(endpoint)
    data = response.body
    JSON.parse(data, symbolize_names: true)
  end
end
