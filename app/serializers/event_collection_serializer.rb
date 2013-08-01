class EventCollectionSerializer
  takes :event_serializer

  def serialize(events)
    "[#{events.map { |event| event_serializer.serialize(event) }.join(',')}]"
  end
end
