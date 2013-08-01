Mime::Type.register 'vnd.api+json', :json_api

ActionController::Renderers.add(:json_api) do |resource, options|
  self.content_type ||= Mime::Type.lookup('vnd.api+json')
  self.response_body  = resource
end
