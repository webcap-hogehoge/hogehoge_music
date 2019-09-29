# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # prepend_before_action :require_no_authentication, only: :cancel

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    # self.resource = warden.authenticate!(auth_options)
    # if resource.is_deleted == 1
    #   flash[:notice] = "この会員はすでに退会しています。"
    #   redirect_to new_end_user_session_path
    # else
    #   set_flash_message!(:notice, :signed_in)
    #   sign_in(resource_name, resource)
    #   yield resource if block_given?
    #   respond_with resource, location: after_sign_in_path_for(resource)
    # end
    user = EndUser.find_by(email: params[:end_user][:email])
    if user.is_deleted == 1
      flash[:alert] = "このユーザはすでに退会しています。"
      redirect_to new_end_user_session_path
    else
      super
    end
  end

  # DELETE /resource/sign_out
  def destroy
  if params[:is_deleted] == "1"
    @user =  current_end_user
    @user.is_deleted = 1
    @user.save
    #end
    #フラッシュメッセージ表示
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :destroyed if signed_out
    yield if block_given?
    respond_to_on_destroy
  elsif params[:is_deleted] != "1"
    super
  end
end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [ :last_name_kanji, :first_name_kanji,
            :last_name_katakana, :first_name_katakana, :email, :password, :password_confirmation])
  end

end
