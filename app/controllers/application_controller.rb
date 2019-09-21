class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    case resource
    when EndUser
      root_path
    when Administrator
      admin_root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :end_user
      root_path
    when :administrator
      new_administrator_session_path
    end
  end

  def set_search
    @q = Product.ransack(params[:q])
    #@q_products = @search.result.page(params[:page])
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :last_name_kanji, :first_name_kanji,
            :last_name_katakana, :first_name_katakana, :email, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
  end
end
