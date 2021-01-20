require 'rails_helper'

describe BusinessService do
  context "instance methods" do
    it "returns a business" do
      lat_lng = {:lat=>38.265425, :lng=>-104.610415}
      food_category = 'italian'
      business = BusinessService.find_restaurant(lat_lng, food_category)
      expect(business).to be_a Hash

      expect(business).to have_key :name
      expect(business[:name]).to be_a String

      expect(business).to have_key :location
      expect(business[:location]).to be_a Hash

      expect(business[:location]).to have_key :address
      expect(business[:location][:address]).to be_a String
    end
  end
end