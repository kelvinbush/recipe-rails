class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, foreign_key: 'user_id', dependent: :delete_all
  has_many :foods, foreign_key: :user_id, dependent: :delete_all
  has_many :inventories, foreign_key: :user_id, dependent: :delete_all
  validates :name, presence: true, length: { in: 4..250 }
end
