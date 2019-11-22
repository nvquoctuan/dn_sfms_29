class AdminController < ApplicationController
  before_action :logged_in?
  before_action :check_user

  layout "admin/application"

  private

  def check_admin
    return if current_user.admin?

    redirect_to root_path
    flash[:danger] = t "admin.danger_permission"
  end

  def check_user
    return unless current_user.user?

    redirect_to root_path
    flash[:danger] = t "admin.danger_permission"
  end
end
