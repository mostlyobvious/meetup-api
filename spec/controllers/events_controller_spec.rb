require 'spec_helper'

describe EventsController do
  let(:event_serializer)            { fake(:event_serializer) }
  let(:event_collection_serializer) { fake(:event_collection_serializer) }
  let(:event_repository)            { fake(:event, as: :class) }
  let(:event)                       { fake(:event) }
  let(:event_collection)            { [event, event] }
  let(:event_id)                    { '42' }

  before do
    stub(controller).event_repository            { event_repository }
    stub(controller).event_serializer            { event_serializer }
    stub(controller).event_collection_serializer { event_collection_serializer }
  end

  context 'GET #index' do
    before do
      stub(event_repository).events_for_public_listing { event_collection }
      get :index, format: 'json_api'
    end

    specify { expect(response.code).to eq('200') }
    specify { expect(response.content_type).to eq('vnd.api+json') }
    specify { expect(event_collection_serializer).to have_received.serialize(event_collection) }
  end

  context 'GET #show' do
    before do
      stub(event_repository).find_event_by_id(event_id) { event }
      get :show, id: event_id, format: 'json_api'
    end

    specify { expect(response.code).to eq('200') }
    specify { expect(response.content_type).to eq('vnd.api+json') }
    specify { expect(event_serializer).to have_received.serialize(event) }
  end
end
