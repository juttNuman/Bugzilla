class RenameTypeOfToCategoryInBugs < ActiveRecord::Migration[7.1]
  def change
    rename_column :bugs, :type_of, :category
  end
end
