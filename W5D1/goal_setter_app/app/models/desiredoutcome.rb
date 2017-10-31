class Desiredoutcome < ApplicationRecord
  include Commentable

  validates :title, presence: true, length: { minimum: 6 }

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User

  has_many :cheers

  def cheered_by?(user)
    cheers.exists?(giver_id: user.id)
  end
end
