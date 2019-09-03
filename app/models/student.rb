class Student < ApplicationRecord
    has_many :ducks
    validates :name, presence: true
    validate :mod_range

    def mod_range
        if !self.mod or self.mod < 1 or self.mod > 5
            errors.add(:mod, "out of range")
        end
    end
end
