class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_locale(locale)
    I18n.locale = locale
  end

  def locale
    # ここで言語の切り替えを行う
    @locale ||= params[:locale] || I18n.default_locale
  end
end
