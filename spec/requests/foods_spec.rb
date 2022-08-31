require 'rails_helper'

RSpec.describe "Foods", type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'Kelvin', password: 'password', email: 'kelybush@gmail.com')
    @food = @user.foods.create(name: 'Chapati', measurement_unit: 'kg', price: 5, quantity: 2)
    sign_in @user
  end

  describe "GET /index" do
    it "returns http success" do
      get foods_path
      expect(response).to have_http_status(:success)
    end
  end

end
