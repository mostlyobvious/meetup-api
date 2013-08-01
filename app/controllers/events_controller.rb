class EventsController < ApplicationController
  def index
    events = event_repository.events_for_public_listing

    respond_to do |format|
      format.json_api { render json_api: event_collection_serializer.serialize(events) }
    end
  end

  def show
    event = event_repository.find_event_by_id(params[:id])

    respond_to do |format|
      format.json_api { render json_api: event_serializer.serialize(event) }
    end
  end

  def event_repository
    Event
  end

  def event_serializer
    EventSerializer.new
  end

  def event_collection_serializer
    EventCollectionSerializer.new(event_serializer)
  end
end
