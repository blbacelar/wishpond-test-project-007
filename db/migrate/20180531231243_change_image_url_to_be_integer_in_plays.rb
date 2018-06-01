class ChangeImageUrlToBeIntegerInPlays < ActiveRecord::Migration[5.2]
  def change
    change_column :plays, :image_url, :integer
  end
end
