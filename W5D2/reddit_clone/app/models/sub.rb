class Sub < ApplicationRecord
  validates :title, :description, :moderator, presence: true

  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :creator_id,
  class_name: :User,
  inverse_of: :subs

  has_many :postsubs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :postsubs, source: :post
end
