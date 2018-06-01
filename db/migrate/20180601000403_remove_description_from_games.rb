class RemoveDescriptionFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :description, :text
  end
end
