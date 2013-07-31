class EventCollectionPresenter
  include ActiveModel::Serializers::JSON

  attr_reader :events, :event_presenter_factory

  def initialize(events, event_presenter_factory = EventPresenter)
    @events = events
    @event_presenter_factory = event_presenter_factory
  end

  def as_json(*)
    events.collect { |event| event_presenter_factory.new(event).as_json }
  end

  def to_json_api
    to_json
  end
end
