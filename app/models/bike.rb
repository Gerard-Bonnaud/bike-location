class Bike < ApplicationRecord
  belongs_to :user

  has_many :users, through: :rents
  has_many :rents, dependent: :destroy

  validates :name, :price, :content, presence: true
end
