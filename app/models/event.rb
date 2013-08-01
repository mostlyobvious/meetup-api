class Event < ActiveRecord::Base
  def self.events_for_public_listing
    all
  end

  def self.find_event_by_id(id)
    find(id)
  end
end
