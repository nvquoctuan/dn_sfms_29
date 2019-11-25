class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :subpitch
  has_one :rating

  enum status: {cancel: -1, verifiled_paid: 0,
                verifiled_not_pay: 1, unverifile: 2}
end
