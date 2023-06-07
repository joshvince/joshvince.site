# frozen_string_literal: true

class InfoController < ApplicationController
  def me
    @page_title = "About me"
  end

  def contact
    @page_title = "Contact me"
  end
end
