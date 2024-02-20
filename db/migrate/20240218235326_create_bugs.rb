class CreateBugs < ActiveRecord::Migration[7.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.integer :status
      t.string :type
      t.references :user, foreign_key: true, index: true, null: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
