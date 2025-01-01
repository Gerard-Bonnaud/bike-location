class Bike < ApplicationRecord
  belongs_to :user

  has_many :users, through: :rents
  has_many :rents, dependent: :destroy
  has_one_attached :photo

  validates :name, :price, :content, presence: true
end
