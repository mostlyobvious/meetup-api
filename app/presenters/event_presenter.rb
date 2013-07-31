class EventPresenter
  include ActiveModel::Serializers::JSON

  attr_reader :event

  def initialize(event)
    @event = event
  end

  def as_json(*)
    {
      name: event.name
    }
  end

  def to_json_api
    to_json
  end
end
