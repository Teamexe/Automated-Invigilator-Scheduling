class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.text :course_id
      t.text :course
      t.text :cls
      t.text :room
      t.time :time
      t.date :date

      t.timestamps
    end
  end
end
