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
#
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
