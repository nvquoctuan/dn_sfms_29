class ApplicationController < ActionController::Base
  before_action :set_locale
  include SessionsHelper

  def set_flash notify, action, active = 0
    if active == 0
      flash[notify.to_sym] = t ".msg.#{action}_#{notify}"
    elsif active == 1
      flash.now[notify.to_sym] = t ".msg.#{action}_#{notify}"
    end

  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
