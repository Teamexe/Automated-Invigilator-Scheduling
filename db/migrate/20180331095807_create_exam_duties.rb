class CreateExamDuties < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_duties do |t|
      t.references :teacher, foreign_key: true
      t.references :exam, foreign_key: true

      t.timestamps
    end
  end
end
