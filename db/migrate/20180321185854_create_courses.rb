class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.text :name
      t.text :course_id

      t.timestamps
    end
  end
end
