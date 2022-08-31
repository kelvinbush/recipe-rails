# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#index'
  resources :recipes, only: %i[index new show create destroy update edit] do
    resources :recipe_foods, only: %i[new create destroy]
  end  

end
