class EventSerializer
  def serialize(event)
    JSON.dump({ name: event.name })
  end
end
