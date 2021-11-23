class AddUserIdToRecruits < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :user_id, :integer
  end
end
