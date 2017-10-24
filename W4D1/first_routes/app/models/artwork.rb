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

class Artwork < ApplicationRecord

  validates :title, presence: true,
  uniqueness: {scope: :artist_id, message: 'Cannot have duplicate titles.'}
  validates :image_url, presence: true

  belongs_to :artist,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :User

  has_many :shares,
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: :SharedWork

  has_many :shared_viewers,
  through: :shares,
  source: :viewer
end
