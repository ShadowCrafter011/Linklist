class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.string :link
      t.references :link_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
