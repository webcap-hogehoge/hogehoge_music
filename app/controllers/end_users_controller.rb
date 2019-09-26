class EndUsersController < ApplicationController
before_action :authenticate_end_user!, only: [:show, :mypage, :edit, :destroy, :comfirm, :unsubscribe]
before_action :authenticate_administrator!, only: [:index, :admin_show, :admin_end_user_destroy, :edit, :update]
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
    #@user =  current_end_user
    #@user.is_deleted = 1
    #@user.save
    #session[:delete_params] = 0
    #flash[:notice] = "会員情報を削除しました。"
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
    @users = EndUser.active.page(params[:page]).per(30).order(created_at: :desc)
  end

  def admin_show
    if EndUser.find(params[:id]).is_deleted == 1
      flash[:notice] = "このユーザはすでに退会しています。"
      redirect_to end_users_path
    else
      @user = EndUser.active.find(params[:id])
      @addresses_is_main = @user.addresses.find_by(is_main: 1)
      @order_histories = @user.order_histories.all.order(created_at: :desc)
    end
  end

  def admin_end_user_destroy
    @user =  EndUser.find(params[:id])
    @user.is_deleted = 1
    @user.save
    redirect_to end_users_path
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
