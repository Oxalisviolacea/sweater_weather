require 'rails_helper'

describe 'Background API Endpoint' do
  it 'it can send an image from unsplash' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    background = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(background).to have_key :data
    expect(background[:data]).to be_a Hash

    expect(background[:data]).to have_key :type
    expect(background[:data][:type]).to be_a String

    expect(background[:data]).to have_key :id
    expect(background[:data][:id]).to eq(nil)

    expect(background[:data]).to have_key :attributes
    expect(background[:data][:attributes]).to be_a Hash

    expect(background[:data][:attributes]).to have_key :image
    expect(background[:data][:attributes][:image]).to be_a Hash

    image = background[:data][:attributes][:image]

    expect(image).to have_key :location
    expect(image[:location]).to be_a String

    expect(image).to have_key :image_url
    expect(image[:image_url]).to be_a String

    expect(image).to have_key :credit
    expect(image[:credit]).to be_a Hash

    expect(image[:credit]).to have_key :source
    expect(image[:credit][:source]).to be_a String

    expect(image[:credit]).to have_key :author
    expect(image[:credit][:author]).to be_a String

    expect(image[:credit]).to have_key :logo
    expect(image[:credit][:logo]).to be_a String
  end
end
