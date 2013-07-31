class EventSerializer
  include ActiveModel::Serializers::JSON

  def serialize(event)
    JSON.dump({ name: event.name })
  end
end
