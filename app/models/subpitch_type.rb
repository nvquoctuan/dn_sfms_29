class SubpitchType < ApplicationRecord
  has_many :subpitches, dependent: :destroy
end
