class ChangeUserNullInCollaborations < ActiveRecord::Migration[7.1]
  def change
    change_column :collaborations, :user_id, :integer, null: true
  end
end
