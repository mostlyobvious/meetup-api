class EventsController < ApplicationController
  respond_to :json_api

  def index
    events = EventCollectionSerializer.new(Event.for_public_listing)
    respond_with events
  end

  def show
    event = EventSerializer.new(Event.find_by_id(params[:id]))
    respond_with event
  end
end
