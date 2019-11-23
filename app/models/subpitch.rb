class Subpitch < ApplicationRecord
  belongs_to :pitch
  belongs_to :subpitch_type

  delegate :name, to: :pitch, prefix: true
  delegate :name, to: :subpitch_type, prefix: true

  has_one_attached :picture
  scope :by_pitch, ->(pitch_id){where(pitch_id: pitch_id)}
end
