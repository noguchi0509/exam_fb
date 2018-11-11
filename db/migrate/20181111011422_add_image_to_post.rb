class AddImageToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :Image, :string
  end
end
