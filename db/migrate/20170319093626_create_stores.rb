class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.references :user, foreign_key: true
      t.string :name, :null => false
      t.string :slug, :null => false
      t.timestamps
    end

    add_index :stores, :slug, :unique => true
    remove_foreign_key :stores, :users
    add_foreign_key :stores, :users, on_delete: :cascade
  end
end
