class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sing_up, keys: [
            :last_name_kanji, :first_name_kanji,
            :last_name_katakana, :first_name_katakana
            ])
  end
end
