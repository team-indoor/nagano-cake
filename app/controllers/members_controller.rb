class MembersController < ApplicationController
  before_action :authenticate_member!

  def show
  	@member = Member.find(params[:id])
  end

  def edit
  	@member =Member.find(params[:id])
  end

  def update
    @member =Member.find(params[:id])
    if @member.update(member_params)
       redirect_to action: :show
  else
    @members =Member.all
    render action: :edit
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to root_path
  end
end
private
    def member_params
      params.require(:member).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :address, :phone_number)
    end
end