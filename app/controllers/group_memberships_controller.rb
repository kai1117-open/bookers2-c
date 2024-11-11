class GroupMembershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @membership = GroupMembership.new(user: current_user, group_id: params[:group_id])
    if @membership.save
      redirect_to group_path(params[:group_id]), notice: 'グループに参加しました。'
    else
      redirect_to group_path(params[:group_id]), alert: '参加に失敗しました。'
    end
  end

  def destroy
    @group_membership = GroupMembership.find_by(user_id: current_user.id, group_id: params[:group_id])
  
    if @group_membership
      @group_membership.destroy
      redirect_to group_path(@group_membership.group), notice: 'グループを退出しました。'
    else
      redirect_to root_path, alert: 'Error: Membership not found or already removed'
    end
  end
end  
