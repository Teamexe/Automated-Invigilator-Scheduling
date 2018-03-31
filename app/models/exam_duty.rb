class ExamDuty < ApplicationRecord
  belongs_to :teacher
  belongs_to :exam
end
