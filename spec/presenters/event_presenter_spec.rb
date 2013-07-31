require 'spec_helper'

describe EventPresenter do
  let(:event_presenter) { described_class.new(event) }
  let(:event)           { fake(:event, name: 'bazinga') }
  let(:body)            { JSON.parse(event_presenter.to_json_api) }

  specify { expect(event_presenter).to respond_to(:to_json_api) }
  specify { expect(event_presenter).to respond_to(:as_json) }

  specify { expect(body['name']).to eq('bazinga') }
end
