class EventCollectionSerializer
  attr_reader :event_serializer

  def initialize(event_serializer = EventSerializer.new)
    @event_serializer = event_serializer
  end

  def serialize(events)
    "[#{events.map { |event| event_serializer.serialize(event) }.join(',')}]"
  end
end
