class AddressesController < ApplicationController
  before_action :authenticate_member!
  before_action :active_member?
  before_action :ensure_correct_member?
  
  def index
    @address = Address.new
    @addresses = Address.where(member_id: current_member.id)
    @member = Member.find(params[:member_id])
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.member_id = params[:member_id].to_i
    if @address.save
       redirect_to member_addresses_path
    else
       @addresses = Address.where(member_id: current_member.id)
       @member = Member.find(params[:member_id])
       render action: :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
       redirect_to member_addresses_path
    else
       @addresses = Address.all
       render action: :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to member_addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :reciever, :member_id)
  end
end