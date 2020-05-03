class AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
    @member = Member.find(params[:member_id])
  end

  def edit
    @address = Address.find(params[:id])
  end

  def destroy
  end

end