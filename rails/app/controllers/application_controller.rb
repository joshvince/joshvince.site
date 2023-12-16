# frozen_string_literal: true

class ApplicationController < ActionController::Base
  after_action :record_page_view

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def record_page_view
    valid_request_checks = [
      response.content_type,
      response.content_type.start_with?("text/html"),
      !request.is_crawler?,
      request.host.match?(/joshvince.site/)
    ]

    return unless valid_request_checks.all?

    ActiveAnalytics.record_request(request)
  end

end
