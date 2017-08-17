class Mitra < ApplicationRecord
  has_many :meditations
  has_many :kirtans

  before_create -> { self.auth_token = SecureRandom.hex }

end
