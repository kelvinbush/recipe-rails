class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :recipe_foods, foreign_key: 'food_id', dependent: :delete_all

  validates :measurement_unit, presence: true
  validates :name, presence: true, length: { in: 4..250 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
