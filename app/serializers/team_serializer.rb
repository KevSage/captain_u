class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :age_group, :coach, :players
end
