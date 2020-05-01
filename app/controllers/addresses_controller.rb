class AddressesController < ApplicationController
  def index
  	@addresses = Address.all
  	@address = Address.find(params[:id])
  end

  def edit
  	@address = Address.find(params[:id])
  end

  def destroy
  	@address = 
  end
private
    def address_params
      params.require(:address).permit(:postal_code, :address, :reciever)
    end
end