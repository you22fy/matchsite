class ImageColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :image,:string
  end
end
