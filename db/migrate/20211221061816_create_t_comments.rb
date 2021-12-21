class CreateTComments < ActiveRecord::Migration[6.0]
  def change
    create_table :t_comments do |t|

      t.timestamps
    end
  end
end
