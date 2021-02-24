class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :height, :weight, :birthday, :graduation_year, :position, :recruit
end
