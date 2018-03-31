class Exam < ApplicationRecord
    has_many :exam_duties, dependent: :destroy
end
