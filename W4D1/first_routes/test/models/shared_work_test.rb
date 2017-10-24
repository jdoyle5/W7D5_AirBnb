# == Schema Information
#
# Table name: shared_works
#
#  id         :integer          not null, primary key
#  artwork_id :integer
#  viewer_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SharedWorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
