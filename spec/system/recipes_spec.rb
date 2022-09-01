require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Kelvin', password: 'password', email: 'kelybush@gmail.com')
    @recipe = @user.recipes.create(name: 'Chapati')
    sign_in @user
  end

  it 'should show correct food ' do
    visit recipes_path
    expect(page).to have_content(@recipe.name)
  end

  it 'should redirect to add new food' do
    visit recipes_path
    click_on 'Add new recipe'
    expect(page).to have_current_path(new_recipe_path)
  end
end
