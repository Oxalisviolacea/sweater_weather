class PhotoService
  def self.background_for_(location)
    response = conn.get('/search/photos') do |faraday|
      faraday.params['query'] = location
    end

    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first
  end

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH-API-KEY']
    end
  end
end
