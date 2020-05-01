class Admins::MembersController < ApplicationController
  def index
  	@members = Member.all
  end

  def show
  	@members = Member.all
  end

  def edit
  	@members = Member.all
  end
end
