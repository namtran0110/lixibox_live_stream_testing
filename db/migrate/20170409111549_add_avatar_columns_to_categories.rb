class AddAvatarColumnsToCategories < ActiveRecord::Migration[5.0]
  def up
    add_attachment :categories, :avatar
  end

  def down
    remove_attachment :categories, :avatar
  end
end
