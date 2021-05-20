class ApplicationController < ActionController::API
  include JsonResponder
  include Pagy::Backend
end
