# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  has_many :visits,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Visit

  has_many :visited_urls,
  through: :visits,
  source: :short_url


  validates :email, presence: true, uniqueness: true



  def submitted_urls
    ShortenedUrl.find_by_user_id(self.id)
  end


end
