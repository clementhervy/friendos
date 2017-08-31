class GroupsController < ApplicationController
  before_action :require_login

  def index
    @groups_created = Group.where(creator: current_user)
    @groups_participating = Group.includes(:users).where(user_id: current_user.id)
  end

  def show; end

  def new; end

  def create
    @group = Group.new(required_parameters)
    @group.creator = current_user
    @group.user_ids = params[:users]
    @group.user_ids << current_user.id
    @group.save
    redirect_to landing_path
  end

  private

  def required_parameters
    params.require(:group).permit(:name, users: [].delete(''))
  end
end
