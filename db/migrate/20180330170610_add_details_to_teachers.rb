class AddDetailsToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers,:department,:text
    add_column :teachers,:name,:text
  end
end
