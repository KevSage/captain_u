class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :state, :start_date
end
