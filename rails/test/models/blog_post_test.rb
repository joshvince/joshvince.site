# == Schema Information
#
# Table name: blog_posts
#
#  id               :bigint           not null, primary key
#  slug             :string
#  title            :string
#  published_on     :date
#  subtitle         :string
#  markdown_content :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
