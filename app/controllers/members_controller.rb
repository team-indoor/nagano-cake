class MembersController < ApplicationController
  def show
  	@members = Member.all
  end

  def edit
  	@member =Member.find(params[:id])
  end

  def delete
  end
end
private
    def member_params
      params.require(:member).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :address, :phone_number, :password)
    end