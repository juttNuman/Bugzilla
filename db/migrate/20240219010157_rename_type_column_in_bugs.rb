class RenameTypeColumnInBugs < ActiveRecord::Migration[7.1]
  
    def change
      rename_column :bugs, :type, :type_of
    end
  
end
