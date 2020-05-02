class Admins::MembersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
  	@members = Member.all
  end

  def show
  	@member = Member.find(params[:id])
  end

  def edit
  	@member = Member.find(params[:id])
  end

  def update
  	@member = Member.find(params[:id])
  	if @member.update(member_params)
  	redirect_to admins_member_path(@member.id)
    else
       @member = Member.find(params[:id])
       render action: :edit
    end
  end

   private
    def member_params
        params.require(:member).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :phone_number, :postal_code, :address, :is_active)
    end
end
