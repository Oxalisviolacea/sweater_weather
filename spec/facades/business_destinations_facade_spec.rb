require 'rails_helper'

RSpec.describe 'BusinessDestinations Facade' do
  it 'returns a a business' do
    destination = 'pueblo,co'
    food_category = 'italian'

    business = BusinessDestinationsFacade.find_food(destination, food_category)

    expect(business).to be_a Business
  end
end