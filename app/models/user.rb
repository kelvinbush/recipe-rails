# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :foods, foreign_key: 'user_id', :dependent => :delete_all
  has_many :recipes, foreign_key: 'user_id', :dependent => :delete_all
end
