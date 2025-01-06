class AddDefaultToRentsStatut < ActiveRecord::Migration[7.2]
  def change
    change_column_default :rents, :statut, "En attente"
    Rent.where(statut: nil).update_all(statut: "En attente")
  end
end
