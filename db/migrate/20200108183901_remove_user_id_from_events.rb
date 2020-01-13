class RemoveUserIdFromEvents < ActiveRecord::Migration[6.0]
  def change

    remove_column :events, :user_id, :integer
  end
end
