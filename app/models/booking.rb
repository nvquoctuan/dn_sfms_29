class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :subpitch

  delegate :full_name, to: :user, prefix: true
  delegate :name, to: :subpitch, prefix: true
  enum status: {"Verifiled and paid": 0,
                "Verifiled and not pay": 1, "Unverifile": 2 }
  scope(:booking_user, lambda do |user_id|
    joins(:user).joins(:subpitch).where(bookings: {user_id: user_id})
  end)

  scope(:search_booking, lambda do |search|
    where("(subpitches.name LIKE ?) OR (bookings.total_price = ?)",
          "%#{search}%", search)
  end)
end
