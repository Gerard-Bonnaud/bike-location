class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :statut, inclusion: { in: ["En attente", "Accepté", "Rejeté"] }
end
