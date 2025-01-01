class CreateBikes < ActiveRecord::Migration[7.2]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :content
      t.integer :price
      t.integer :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
