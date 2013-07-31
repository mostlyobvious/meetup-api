require 'spec_helper'

describe EventCollectionPresenter do
  let(:event_collection_presenter) { described_class.new(event_collection, event_presenter_factory) }
  let(:event_presenter_factory)    { fake(:event_presenter, as: :class) }
  let(:event)                      { fake(:event, name: 'bazinga') }
  let(:event_collection)           { [event, event] }
  let(:body)                       { JSON.parse(event_collection_presenter.to_json_api) }

  specify { expect(event_collection_presenter).to respond_to(:to_json_api) }
  specify { expect(event_collection_presenter).to respond_to(:as_json) }

  specify { expect(body).to have(2).items }
end
