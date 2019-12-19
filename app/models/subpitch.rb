class Subpitch < ApplicationRecord
  PARAMS = %i(name description status price_per_hour currency
            picture size pitch_id subpitch_type_id).freeze
  belongs_to :pitch
  belongs_to :subpitch_type

  validates :name, presence: true, length: {maximum: Settings.size.s50}
  validates :description, length: {maximum: Settings.size.s255}
  validates :price_per_hour, presence: true, numericality: true
  validates :size, presence: true, length: {maximum: Settings.size.s50}

  delegate :name, to: :pitch, prefix: true
  delegate :name, to: :subpitch_type, prefix: true
  has_one_attached :picture

  scope :search, (lambda do |subpitch|
    where("name LIKE ?", "%#{subpitch}%") if subpitch
  end)

  scope :by_pitch, ->(pitch_id){where pitch_id: pitch_id}
end
