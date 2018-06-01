class ChangeImageUrlColumnToImageIndex < ActiveRecord::Migration[5.2]
  def change
    rename_column :plays, :image_url, :image_index
  end
end
