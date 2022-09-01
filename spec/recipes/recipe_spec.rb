require 'rails_helper'

RSpec.describe 'Recipes Index', type: :feature do
  include Devise::Test::IntegrationHelpers
  subject { User.new(name: 'Camilux', email: 'camile@gmail.com', password: 'azerty') }

  before :each do
    subject.save
    sign_in subject
    @recipe = Recipe.create(name: 'Pilau', user_id: subject.id, description: 'test description')
  end

  it 'Recipes' do
    visit '/recipes'
    expect(page).to have_content 'Pilau'
  end

  it 'See description' do
    visit '/recipes'
    expect(page).to have_content 'test description'
  end

  it 'Visit recipe details' do
    visit "/recipes/#{@recipe.id}"
    expect(page).to have_content 'test description'
  end

  it "When I click on a post, it redirects me to that post's show page." do
    visit '/recipes'
    click_on('Pilau')
    expect(page)
      .to have_current_path("/recipes/#{@recipe.id}")
  end
end
