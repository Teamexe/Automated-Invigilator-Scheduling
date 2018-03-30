class AddRolesToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers,:roles,:integer, default: 0
  end
end
