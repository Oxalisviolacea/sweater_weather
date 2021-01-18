class Background
  attr_reader :location, :image_url, :author

  def initialize(photo, location)
    @location = location
    @image_url = photo[:urls][:raw]
    @author = photo[:user][:name]
  end
end
