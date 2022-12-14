class Api::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :authorize_user, only: [:update, :destroy]
  before_action :authenticate_user

  def index
    render json: Event.all, status: :ok
  end

  def show
    render json: @event, serializer: EventDetailSerializer, status: :ok
  end
  
  def create
    event = current_user.created_events.create!(event_params)
    render json: event, status: :created
  end

  def update
    @event.update!(event_params)
    render json: @event, status: :ok
  end

  def destroy
    @event.destroy!
  end

  private

  def event_params
    params.permit(:title, :description, :location, :starts_at, :ends_at, :group_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def authorize_user
    return if current_user.admin? || @event.user == current_user
    render json: { error: "You don't have permission to perform that action" }, status: :forbidden
  end

end
