class Subpitch < ApplicationRecord
  has_many :booking, dependent: :destroy
  belongs_to :pitch
  belongs_to :subpitch_type

  delegate :name, to: :pitch, prefix: true
  delegate :name, to: :subpitch_type, prefix: true

  has_one_attached :picture
end
