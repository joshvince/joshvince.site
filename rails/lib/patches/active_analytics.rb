# frozen_string_literal: true

ActiveAnalytics::ApplicationController.class_eval do
  before_action :require_admin

  def require_admin
    return true if Rails.env.development?

    authenticate_or_request_with_http_basic do |username, password|
      authenticated = username == ENV["ANALYTICS_USERNAME"] && password == ENV["ANALYTICS_PASSWORD"]

      raise ActionController::RoutingError.new("Not found") unless authenticated

      authenticated
    end
  end
end
