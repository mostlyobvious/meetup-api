require 'spec_helper'

describe EventCollectionSerializer do
  let(:event_collection_serializer) { described_class.new(event_collection, event_serializer_factory) }
  let(:event_serializer_factory)    { fake(:event_serializer, as: :class) }
  let(:event)                       { fake(:event, name: 'bazinga') }
  let(:event_collection)            { [event, event] }
  let(:body)                        { JSON.parse(event_collection_serializer.to_json_api) }

  specify { expect(event_collection_serializer).to respond_to(:to_json_api) }
  specify { expect(event_collection_serializer).to respond_to(:as_json) }

  specify { expect(body).to have(2).items }
end
