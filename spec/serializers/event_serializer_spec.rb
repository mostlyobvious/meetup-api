require 'spec_helper'

describe EventSerializer do
  let(:event_serializer) { described_class.new(event) }
  let(:event)            { fake(:event, name: 'bazinga') }
  let(:body)             { JSON.parse(event_serializer.to_json_api) }

  specify { expect(event_serializer).to respond_to(:to_json_api) }
  specify { expect(event_serializer).to respond_to(:as_json) }

  specify { expect(body['name']).to eq('bazinga') }
end
