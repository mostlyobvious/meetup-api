class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  extend Dependor::Injectable
  inject_from Injector
end
