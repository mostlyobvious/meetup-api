class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  extend Dependor::Injectable
  inject_from Injector

  def render_json_api(resource)
    respond_to do |format|
      format.json_api { render json_api: resource }
    end
  end
end
