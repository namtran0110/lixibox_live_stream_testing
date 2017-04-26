class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :status
      t.attachment :video
      t.string :youtube_id
      t.integer :user_id

      t.timestamps
    end
  end
end
