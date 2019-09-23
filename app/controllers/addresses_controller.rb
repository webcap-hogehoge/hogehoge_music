class AddressesController < ApplicationController
before_action :authenticate_end_user!
before_action :authenticate_administrator!

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)

    @address.save!
    redirect_to user_path(current_end_user.id)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
       redirect_to user_path(address.end_user_id)
    else
       redirect_to edit_address_path(address.id)
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to user_path(address.end_user_id)
  end


  private
  def address_params
  	params.require(:address).permit(:last_name, :first_name, :telephone_number, :postal_code_1, :postal_code_2, :address, :end_user_id)
  end
end