class BusinessDestinationsFacade
  def self.find_food(destination, food_category)
    lat_lng = LocationService.find_lat_lng(destination)
    business_info = BusinessService.find_restaurant(lat_lng, food_category)
    Business.new(business_info)
  end
end