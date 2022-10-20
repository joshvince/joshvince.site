# frozen_string_literal: true

# rubocop:disable Style/Documentation
module ApplicationHelper
  def underlined_external_link(text, url, options = {})
    link_to(text, url, class: 'underline', target: :_blank, rel: :noopener, **options)
  end

  def underlined_internal_link(text, url, options = {})
    link_to(text, url, class: 'underline', **options)
  end
end
# rubocop:enable Style/Documentation
