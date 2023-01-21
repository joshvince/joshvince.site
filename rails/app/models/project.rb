# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  slug        :string
#  name        :string
#  subtitle    :string
#  description :jsonb
#  link_1_name :string
#  link_1      :string
#  link_2_name :string
#  link_2      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tagline     :string
#  index       :integer
#
class Project < ApplicationRecord
  class Paragraph
    def initialize(hash)
      @text = hash.fetch("text", "")
      @heading = hash.fetch("heading", "")
    end

    attr_reader :text, :heading
  end

  def description_paragraphs
    JSON.parse(description).map { |para| Paragraph.new(para) }
  end
end
