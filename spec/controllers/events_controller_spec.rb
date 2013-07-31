require 'spec_helper'

describe EventsController do
  let(:event_presenter)                    { fake(:event_presenter) }
  let(:event_collection_presenter)         { fake(:event_collection_presenter) }
  let(:event)                              { fake(:event) }
  let(:event_collection)                   { [event, event] }
  let(:event_repository)                   { stub(Event) }
  let(:event_presenter_factory)            { stub(EventPresenter) }
  let(:event_collection_presenter_factory) { stub(EventCollectionPresenter) }

  context 'GET #index' do
    before { event_repository.for_public_listing { event_collection } }
    before { event_collection_presenter_factory.new(event_collection) { event_collection_presenter } }
    before { get :index, format: 'json_api' }

    specify { expect(response.code).to eq('200') }
    specify { expect(response.content_type).to eq('vnd.api+json') }
    specify { expect(event_collection_presenter).to have_received.to_json_api }
  end

  context 'GET #show' do
    before { event_repository.find_by_id('13') { event } }
    before { event_presenter_factory.new(event) { event_presenter } }
    before { get :show, id: '13', format: 'json_api' }

    specify { expect(response.code).to eq('200') }
    specify { expect(response.content_type).to eq('vnd.api+json') }
    specify { expect(event_presenter).to have_received.to_json_api }
  end
end
