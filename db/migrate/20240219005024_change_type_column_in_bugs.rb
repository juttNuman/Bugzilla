class ChangeTypeColumnInBugs < ActiveRecord::Migration[6.0]
  def up
    change_column :bugs, :type, :integer
  end

  def down
    change_column :bugs, :type, :string
  end
end
