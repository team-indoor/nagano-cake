class Admins::MembersController < ApplicationController
  def index
  	@members = Member.all
  end

  def show
  	@member = Member.find(params[:id])
  end

  def edit
  	@member = Member.find(params[:id])
  end
end
