class ChangeCreatedByDataTypeInBugs < ActiveRecord::Migration[7.1]
  def change
   change_column :bugs, :created_by, :string
  end
end

