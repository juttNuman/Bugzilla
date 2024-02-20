class AddDeadlineToBugs < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :deadline, :datetime
  end
end
