class Injector
  include Dependor::AutoInject

  def event_repository
    Event
  end
end
