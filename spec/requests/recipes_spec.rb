require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'Kelvin', password: 'password', email: 'kelybush@gmail.com')
    @recipe = @user.recipes.create(name: 'Chapati')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get recipes_path
      expect(response).to have_http_status(:success)
    end
  end
end
