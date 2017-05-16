class CreateStreamInstances < ActiveRecord::Migration[5.0]
  def change
    create_table :stream_instances do |t|
      t.references :store, foreign_key: true
      t.string :title
      t.integer :product_ids, array: true, default: []

      t.timestamps
    end
  end
end
