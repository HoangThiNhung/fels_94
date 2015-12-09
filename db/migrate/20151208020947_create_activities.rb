class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :target
      t.string :action
      t.references :user

      t.timestamps null: false
    end
  end
end
