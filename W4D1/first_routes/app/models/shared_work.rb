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

class SharedWork < ApplicationRecord
  validates :artwork_id, presence: true, uniqueness: { scope:
  :viewer_id, message: 'Cannot view same piece more than once' }
  validates :viewer_id, presence: true

  belongs_to :artwork,
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: :Artwork

  belongs_to :viewer,
  primary_key: :id,
  foreign_key: :viewer_id,
  class_name: :User
end
