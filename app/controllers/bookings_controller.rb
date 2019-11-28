class BookingsController < ApplicationController
  before_action :check_user

  def index
    @bookings = Booking.booking_user(current_user.id)
                       .search_booking(params[:search])
                       .paginate page: params[:page],
                        per_page: Settings.size.s10
  end

  def check_user
    return if logged_in?

    flash[:danger] = t "msg.danger_permission"
    redirect_to root_path
  end
end
