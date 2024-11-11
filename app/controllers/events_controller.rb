class EventsController < ApplicationController
  before_action :set_group


  def index
    @events = @group.events
  end
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.group = @group
    if @event.save
      @group.members.each do |member|
        EventMailer.notify_event(member, @event).deliver_later
      end
      # 成功時にイベント一覧ページへリダイレクト
      redirect_to group_events_path(@group), notice: 'イベント通知が送信されました。'
    else
      # 失敗時は新規作成フォームを再表示
      render :new
    end
  end
  
  
  

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def event_params
    params.require(:event).permit(:title, :body)
  end
end
