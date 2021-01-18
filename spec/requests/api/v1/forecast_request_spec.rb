require 'rails_helper'

describe "Forecast API" do
  it "sends a list of books" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end