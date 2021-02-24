class Tournament < ApplicationRecord
    has_many :entries
    has_many :teams, through: :entries
    has_many :assessments
end
