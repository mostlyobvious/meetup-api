class EventsController < ApplicationController
  inject :event_repository, :event_serializer, :event_collection_serializer

  def index
    events   = event_repository.events_for_public_listing
    resource = event_collection_serializer.serialize(events)
    render_json_api(resource)
  end

  def show
    event    = event_repository.find_event_by_id(params[:id])
    resource = event_serializer.serialize(event)
    render_json_api(resource)
  end
end
