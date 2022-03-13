class RenameImageIdColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :image_id, :icon_image_id
  end
end
