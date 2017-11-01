class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :postsubs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :postsubs, source: :sub
end
