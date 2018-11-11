class RenameImageColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :Image, :image
  end
end
