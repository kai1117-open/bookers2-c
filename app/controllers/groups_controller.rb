class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :show]
  before_action :authorize_owner, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user
    if @group.save
      redirect_to groups_path, notice: 'グループが作成されました。'
    else
      render :new
    end
  end

  def index
    @groups = Group.all
  end


  def show
    @group = Group.find(params[:id])
    @members = @group.members 
  end

  
  def edit
    @group = Group.find(params[:id])
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'グループが更新されました。'
    else
      render :edit
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def authorize_owner
    redirect_to groups_path, alert: '権限がありません。' unless @group.owner == current_user
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
