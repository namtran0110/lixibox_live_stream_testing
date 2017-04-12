class AddAttachmentCoverPhotoToStores < ActiveRecord::Migration
  def self.up
    change_table :stores do |t|
      t.attachment :cover_photo
    end
  end

  def self.down
    remove_attachment :stores, :cover_photo
  end
end
