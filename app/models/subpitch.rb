class Subpitch < ApplicationRecord
  belongs_to :pitch
  belongs_to :subpitch_type

  has_many :bookings, dependent: :destroy
end
