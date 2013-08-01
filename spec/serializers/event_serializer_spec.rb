require 'spec_helper'

describe EventSerializer do
  let(:event_serializer) { isolate(described_class) }
  let(:serialized_event) { event_serializer.serialize(event) }
  let(:parsed_event)     { JSON.load(serialized_event) }
  let(:event)            { fake(:event, name: 'bazinga') }

  specify { expect(event_serializer).to respond_to(:serialize) }
  specify { expect(parsed_event['name']).to eq('bazinga') }
end
