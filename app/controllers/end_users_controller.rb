class EndUsersController < ApplicationController
before_action :authenticate_end_user!
  def show
    @user = EndUser.find(current_end_user.id)
    @addresses_is_main = @user.addresses.find_by(is_main: 1)
    @addresses = @user.addresses.all.order(created_at: :desc)
  end

  def mypage
  end

  def edit
    @user = EndUser.find(params[:id])
    @addresses = @user.addresses.all
  end

  def update
    @user = EndUser.find(params[:id])
    @user.update!(user_update_params)
    redirect_to user_path
  end

  def destroy
    #@user = User.find_by(id: params[:id])
    #@user.destroy
    self.is_deleted = 1
    save
    redirect_to("/")
  end

  def review
  end

  def likes
  end

  def comfirm
  end

  def unsubscribe
  end


  # 管理者側
  def index
    @users = EndUser.page(params[:page]).per(10)
  end

  def admin_show
    @user = EndUser.find(params[:id])
    @addresses_is_main = @user.addresses.find_by(is_main: 1)
    @order_histories = @user.order_histories.all.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:end_user).permit(:last_name_kanji, :first_name_kanji, :last_name_katakana, :first_name_katakana, :email)
  end

  def user_update_params
    params.require(:end_user).permit(
            :last_name_kanji,
             :first_name_kanji,
              :last_name_katakana,
               :first_name_katakana,
                :email,
                 addresses_attributes: [
                  :id,
            :first_name,
            :last_name,
            :postal_code_1,
            :postal_code_2,
            :address,
            :telephone_number
          ])
  end
end
