class AddStreamingNowToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :streaming_now, :boolean, :default => false
  end
end
