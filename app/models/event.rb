class Event < ActiveRecord::Base
  class << self
    def for_public_listing
      all
    end

    def find_by_id(id)
      find(id)
    end
  end
end
