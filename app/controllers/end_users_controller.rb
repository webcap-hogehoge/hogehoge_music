class EndUsersController < ApplicationController
  def show
    @user = EndUser.find(id: paramas[:id])
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

end
