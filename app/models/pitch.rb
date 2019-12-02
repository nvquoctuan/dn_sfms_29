class Pitch < ApplicationRecord
  belongs_to :user
  has_many :subpitches
  scope :latest_pitches, ->{order(created_at: :desc)}
end
