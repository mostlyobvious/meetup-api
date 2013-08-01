require 'spec_helper'

describe EventSerializer do
  let(:event_serializer) { isolate(described_class) }
  let(:serialized_event) { JSON.parse(event_serializer.serialize(event)) }
  let(:event)            { fake(:event, name: 'bazinga') }

  specify { expect(event_serializer).to respond_to(:serialize) }
  specify { expect(serialized_event['name']).to eq('bazinga') }
end
