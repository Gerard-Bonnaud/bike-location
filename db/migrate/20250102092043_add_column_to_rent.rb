class AddColumnToRent < ActiveRecord::Migration[7.2]
  def change
    add_column :rents, :date_debut, :string
    add_column :rents, :date_fin, :string
  end
end
