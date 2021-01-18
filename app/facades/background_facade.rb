class BackgroundFacade
  def self.background_for_(location)
    photo = PhotoService.background_for_(location)
    Background.new(photo, location)
  end
end