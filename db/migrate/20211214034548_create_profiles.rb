class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :favorite_book
      t.text :self_introduction
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
