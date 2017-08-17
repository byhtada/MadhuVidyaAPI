class MitraSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at

  has_many :meditations
  has_many :kirtans
end
