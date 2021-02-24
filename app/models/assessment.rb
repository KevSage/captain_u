class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :tournament
  belongs_to :player
end
