class Student < ApplicationRecord
    has_many :ducks
    validates :name, presence: true 
    validates :mod, presence: true
    validate :validate_mod

  def validate_mod
    if self.mod > 5 || self.mod < 1
        errors.add(:mod, " can only be 1-5")
    end
  end
end
