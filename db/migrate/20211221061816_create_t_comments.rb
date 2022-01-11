class CreateTComments < ActiveRecord::Migration[6.0]
  def change
    create_table :t_comments do |t|
      t.text :t_text, null: false
      t.references :tweet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
