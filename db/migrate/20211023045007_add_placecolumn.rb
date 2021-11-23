class AddPlacecolumn < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits,:place,:string
  end
end
