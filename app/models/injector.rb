class Injector
  include Dependor::AutoInject

  def event_repository
    Event
  end

  def event_collection_serializer
    EventCollectionSerializer.new(event_serializer)
  end
end
