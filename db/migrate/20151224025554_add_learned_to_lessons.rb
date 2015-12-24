class AddLearnedToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :learned, :boolean
  end
end
