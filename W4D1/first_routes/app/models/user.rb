# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :Artwork

  has_many :viewed_works,
  primary_key: :id,
  foreign_key: :viewer_id,
  class_name: :SharedWork

  has_many :shared_artworks,
  through: :viewed_works,
  source: :artwork
end
