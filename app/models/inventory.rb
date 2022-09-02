class Inventory < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :inventory_foods, foreign_key: :inventory_id, dependent: :delete_all
end
