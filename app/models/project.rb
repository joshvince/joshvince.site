class Project < ApplicationRecord
  class Paragraph
    def initialize(hash)
      @text = hash.fetch("text", "")
      @heading = hash.fetch("heading", "")
    end

    attr_reader :text, :heading
  end

  def job?
    !!job
  end

  def description_paragraphs
    JSON.parse(description).map { |para| Paragraph.new(para) }
  end
end
