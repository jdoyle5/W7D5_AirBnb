# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  artist_id  :integer
#  title      :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ArtworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
