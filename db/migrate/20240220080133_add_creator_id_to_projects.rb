class AddCreatorIdToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :creator_id, :integer
  end
end
