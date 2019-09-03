class Student < ApplicationRecord
    has_many :ducks

    validates :name, presence: true
    validates :mod, inclusion: { in: (1..5).to_a, message: "%{value} is not valid" }
end
