class Business
  attr_reader :name, :address

  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:location][:address]
  end
end
