class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :current_end_user2
  before_action :authenticate_enduser2!

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
    @q_products = @q.result.page(params[:page]).per(35)
  end

  private
  # def current_end_user2
  #     @current_end_user ||= current_end_user.try(:end_user)
  #     binding.pry
  # end

  def authenticate_enduser2!
    return unless end_user_signed_in? && @current_end_user.is_deleted == 1
    sign_out
    flash[:alert] = "この会員はすでに退会しています。"
    redirect_to new_end_user_session_path
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
