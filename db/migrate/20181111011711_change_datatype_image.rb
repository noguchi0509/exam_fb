class ChangeDatatypeImage < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :Image, :text
  end
end
