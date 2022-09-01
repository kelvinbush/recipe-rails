class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :delete_all

  validates :name, presence: true, length: { in: 4..250 }
end
