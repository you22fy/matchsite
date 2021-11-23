class AddLinkColumnToRecruit < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :links, :text
  end
end
