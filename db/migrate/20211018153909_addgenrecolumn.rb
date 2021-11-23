class Addgenrecolumn < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :genre, :string
  end
end
