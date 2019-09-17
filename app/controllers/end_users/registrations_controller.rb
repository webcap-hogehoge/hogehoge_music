# frozen_string_literal: true

class EndUsers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  before_action :create, only: [:complete]
  before_action :configure_sign_up_params, only: [:create]

  def confirm
    @end_user = EndUser.new(sign_up_params)

    @address = @end_user.addresses.build(address_params)


    if @end_user.valid?
      render :action => 'confirm'
    else
     render :action => 'new'
    end
  end

  def complete
    render :template => "products/index"
  end

  # GET /resource/sign_up
  def new
    @end_user = EndUser.new
    super
  end

  def create
    #以下のコード謎多し
    # end_userはnilになっているのに以下のコードがないとaddress情報が保存できない
    end_user = EndUser.new(configure_sign_up_params)

    # address = end_user.addresses.build
    # end_user.addresses.find_by(end_user_id: end_user.id).last_name = params[:end_user][:last_name_kanji]
    # end_user.addresses.find_by(end_user_id: end_user.id).first_name = params[:end_user][:first_name_kanji]
    # end_user.addresses.find_by(end_user_id: end_user.id).is_main = 1

    super

  end

  # GET /resource/edit
  def edit
    super
    @address = resource.addresses.find_by(end_user_id: current_end_user.id)
  end

  # PUT /resource
  def update
    super
    current_end_user.update(configure_account_update_paramse)

  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kanji, :first_name_kanji,
            :last_name_katakana, :first_name_katakana, :email, :password, :password_confirmation,
            addresses_attributes: [:postal_code_1, :postal_code_2, :address, :telephone_number, :last_name, :first_name, :is_main]])
  end

  def address_params
    params.require(:end_user).require(:addresses_attributes)['0'].permit(:postal_code_1, :postal_code_2, :address, :telephone_number, :last_name, :first_name)
  end


  def configure_account_update_paramse
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name_kanji, :first_name_kanji,
            :last_name_katakana, :first_name_katakana, :email, :password, :password_confirmation,
            addresses_attributes: [:postal_code_1, :postal_code_2, :address, :telephone_number]])
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
