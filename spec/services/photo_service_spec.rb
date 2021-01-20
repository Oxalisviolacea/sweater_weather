require 'rails_helper'

describe PhotoService do
  context "instance methods" do
    it "returns data for a photo" do
      VCR.use_cassette('photo_request') do
        background = PhotoService.background_for_('denver,co')

        expect(background).to have_key :urls
        expect(background[:urls]).to be_a Hash

        expect(background[:urls]).to have_key :raw
        expect(background[:urls][:raw]).to be_a String

        expect(background).to have_key :user
        expect(background[:user]).to be_a Hash

        expect(background[:user]).to have_key :name
        expect(background[:user][:name]).to be_a String
      end
    end
  end
end