class AddBelongingColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users,:belonging,:string
  end
end
