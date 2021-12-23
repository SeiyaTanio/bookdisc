class CreateTTags < ActiveRecord::Migration[6.0]
  def change
    create_table :t_tags do |t|
      t.string :t_tag_name, null:false, uniqueness: true
      t.timestamps
    end
  end
end
