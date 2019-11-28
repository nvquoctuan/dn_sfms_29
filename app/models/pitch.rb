class Pitch < ApplicationRecord
  belongs_to :user
  has_many :supbitches, dependent: :destroy
end
