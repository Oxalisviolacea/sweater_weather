require 'rails_helper'

describe LocationService do
  context "instance methods" do
    it "a latitude and longitude for given city and state" do
      VCR.use_cassette('location_service') do
        search = LocationService.find_lat_lng('denver,co')
        expect(search).to be_a Hash

        expect(search).to have_key :lat
        expect(search[:lat]).to be_a(Float)

        expect(search).to have_key :lng
        expect(search[:lng]).to be_a(Float)
      end
    end
  end
end