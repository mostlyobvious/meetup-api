require 'spec_helper'

describe EventCollectionSerializer do
  let(:event_collection_serializer) { isolate(described_class) }
  let(:event_serializer)            { fake(:event_serializer, serialize: '{}') }
  let(:event)                       { fake(:event, name: 'bazinga') }
  let(:event_collection)            { [event, event] }
  let(:serialized_event_collection) { event_collection_serializer.serialize(event_collection) }
  let(:parsed_event_collection)     { JSON.load(serialized_event_collection) }

  specify { expect(event_collection_serializer).to respond_to(:serialize) }
  specify { expect(parsed_event_collection).to have(2).items }

  it 'should serialize individual items' do
    event_collection_serializer.serialize(event_collection)
    expect(event_serializer).to have_received.serialize(event)
  end
end
