class CreateBComments < ActiveRecord::Migration[6.0]
  def change
    create_table :b_comments do |t|
      t.text :b_text, null: false
      t.references :blog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
