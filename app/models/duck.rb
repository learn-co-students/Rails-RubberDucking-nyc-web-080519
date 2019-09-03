class Duck < ApplicationRecord
    belongs_to :student

    validates :name, presence: true
    validates :description, presence: true
    validates :student_id, presence: true
end
