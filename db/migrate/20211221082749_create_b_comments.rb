class CreateBComments < ActiveRecord::Migration[6.0]
  def change
    create_table :b_comments do |t|

      t.timestamps
    end
  end
end
