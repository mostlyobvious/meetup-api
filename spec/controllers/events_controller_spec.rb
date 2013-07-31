require 'spec_helper'

describe EventsController do
  let(:event_serializer)                    { fake(:event_serializer) }
  let(:event_collection_serializer)         { fake(:event_collection_serializer) }
  let(:event)                               { fake(:event) }
  let(:event_collection)                    { [event, event] }
  let(:event_repository)                    { stub(Event) }
  let(:event_serializer_factory)            { stub(EventSerializer) }
  let(:event_collection_serializer_factory) { stub(EventCollectionSerializer) }

  context 'GET #index' do
    before { event_repository.for_public_listing { event_collection } }
    before { event_collection_serializer_factory.new(event_collection) { event_collection_serializer } }
    before { get :index, format: 'json_api' }

    specify { expect(response.code).to eq('200') }
    specify { expect(response.content_type).to eq('vnd.api+json') }
    specify { expect(event_collection_serializer).to have_received.to_json_api }
  end

  context 'GET #show' do
    before { event_repository.find_by_id('13') { event } }
    before { event_serializer_factory.new(event) { event_serializer } }
    before { get :show, id: '13', format: 'json_api' }

    specify { expect(response.code).to eq('200') }
    specify { expect(response.content_type).to eq('vnd.api+json') }
    specify { expect(event_serializer).to have_received.to_json_api }
  end
end
