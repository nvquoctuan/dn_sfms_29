class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :subpitch

  enum status: {"Verified and paid": 0, "Verified and unpaid": 1,
                "Not verified": 2}

  scope(:booking_owner, lambda do |id_user|
    includes(subpitch: :pitch).includes(:user)
                              .where(pitches: {user_id: id_user})
  end)

  scope :last_booking, ->{order(id: :desc)}

  scope(:booking_status, lambda do |status|
    where(bookings: {status: status}) if status != 3
  end)

  scope(:search_booking, lambda do |search|
    joins(:subpitch).where("subpitches.name LIKE ?", "%#{search}%") if search
  end)
end
