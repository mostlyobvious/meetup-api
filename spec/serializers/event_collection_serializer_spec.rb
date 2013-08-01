require 'spec_helper'

describe EventCollectionSerializer do
  let(:event_collection_serializer) { described_class.new(event_serializer) }
  let(:event_serializer)            { fake(:event_serializer, serialize: '{}') }
  let(:event)                       { fake(:event, name: 'bazinga') }
  let(:event_collection)            { [event, event] }
  let(:serialized_event_collection) { JSON.parse(event_collection_serializer.serialize(event_collection)) }

  specify { expect(event_collection_serializer).to respond_to(:serialize) }
  specify { expect(serialized_event_collection).to have(2).items }
end
