class CreateRents < ActiveRecord::Migration[7.2]
  def change
    create_table :rents do |t|
      t.string :statut
      t.references :user, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
