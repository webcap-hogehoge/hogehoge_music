class EndUsersController < ApplicationController
  def show
    @user = EndUser.find(current_end_user.id)
    @addresses_is_main = @user.addresses.find_by(is_main: 1)
    @addresses = @user.addresses.all.order(created_at: :desc)
  end

  def mypage
  end

  def edit
  end

  def update
  end

  def destroy
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
  end

  private

  def user_params
    params.require(:end_user).permit(:last_name_kanji, :first_name_kanji, :last_name_katakana, :first_name_katakana, :email)
  end

end
