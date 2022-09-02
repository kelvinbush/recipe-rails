# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#index'

  get 'general_shopping_list', to: 'shopping#index'
  resources :recipes, only: %i[index new show create destroy update edit] do
    resources :recipe_foods, only: %i[new create destroy update edit]
  end

  resources :public_recipes, only: %i[index show]

  resources :foods, only: [:index, :create, :new, :destroy]

  get 'shopping_list/:recipe_id/:inventory_id', to: 'inventory_shopping#index', as: :shopping_list
end
