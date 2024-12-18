class TheBit
  include Rails.application.routes.url_helpers

  def title
    'The Bit'
  end

  def url
    the_bit_url
  end

  def path
    the_bit_path
  end

  def subtitle
    'A short story made for the web'
  end

  def published_on
    Date.parse('2024-01-15')
  end
end
