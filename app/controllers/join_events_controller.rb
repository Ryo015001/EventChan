class JoinEventsController < ApplicationController
  before_action :set_join_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    event_id = params["event_id"]
    @join_events = JoinEvent.all.where(event_id: event_id)
    respond_with(@join_events)
  end

  def show
    respond_with(@join_event)
  end

  def new
    @join_event = JoinEvent.new
    @join_event.event_id = params[:event_id]
    respond_with(@join_event)
  end

  def edit
  end

  def create
    @join_event = JoinEvent.new(join_event_params) 
    @join_event.event_id = params[:event_id]
    @join_event.save
    respond_with(@join_event)
  end

  def update
    @join_event.update(join_event_params)
    respond_with(@join_event)
  end

  def destroy
    @join_event.destroy
    respond_with(@join_event)
  end

  private
    def set_join_event
      @join_event = JoinEvent.find(params[:id])
    end

    def join_event_params
      params.require(:join_event).permit(:user_id, :event_id, :status, :comment)
    end
end
