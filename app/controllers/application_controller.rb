class ApplicationController < ActionController::Base
  include SessionsHelper
  # before_action :set_locale

private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # def extract_locale_from_tld
  #   parsed_locale = request.host.split('.').last
  #   I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  # end
end
