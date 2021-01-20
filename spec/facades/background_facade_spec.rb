require 'rails_helper'

RSpec.describe 'Background Facade' do
  it 'returns a background for given location' do
    VCR.use_cassette('background_facade') do
      location = 'denver,co'

      background = BackgroundFacade.background_for_(location)

      expect(background).to be_a Background
      expect(background.author).to eq('Michael Kilcoyne')
      expect(background.image_url).to eq('https://images.unsplash.com/photo-1600041161228-519e6dd27bac?ixid=MXwxOTk1NzV8MHwxfHNlYXJjaHwxfHxkZW52ZXIsY298ZW58MHx8fA&ixlib=rb-1.2.1')
      expect(background.location).to eq('denver,co')
    end
  end
end