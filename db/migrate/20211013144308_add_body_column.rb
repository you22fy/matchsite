class AddBodyColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :body,:text
  end
end
