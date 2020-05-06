class MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :active_member?

  def show
  	@member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(@member)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @member = Member.find(params[:id])
    @member.update(is_active: false)
    sign_out(current_member)
    redirect_to root_path
  end

  private
  def member_params
    params.require(:member).permit(
      :last_name,
      :first_name,
      :kana_last_name,
      :kana_first_name,
      :email, :postal_code,
      :address,
      :phone_number, 
      :is_active
    )
  end
end