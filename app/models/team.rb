class Team < ApplicationRecord
    has_many :players
    has_many :entries
    has_many :tournaments, through: :entries
end
