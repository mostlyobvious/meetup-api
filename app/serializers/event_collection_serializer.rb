class EventCollectionSerializer
  attr_reader :event_serializer

  def initialize(event_serializer = EventSerializer.new)
    @event_serializer = event_serializer
  end

  def serialize(events)
    events = events.collect { |event| JSON.parse(event_serializer.serialize(event)) }
    JSON.dump(events)
  end
end
