class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: { safari: 16.4, firefox: 108, ie: false, edge: 89, chrome: 89 }

  after_action :record_page_view

  def not_found
    raise ActionController::RoutingError.new("Not Found")
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
