# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    if params[:is_deleted] == "1"
      @user =  current_end_user
      @user.is_deleted = 1
      @user.save
    end
    #フラッシュメッセージ表示
   signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
   set_flash_message! :notice, :destroyed if signed_out
   yield if block_given?
   respond_to_on_destroy
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [ :last_name_kanji, :first_name_kanji,
            :last_name_katakana, :first_name_katakana, :email, :password, :password_confirmation])
  end

end
