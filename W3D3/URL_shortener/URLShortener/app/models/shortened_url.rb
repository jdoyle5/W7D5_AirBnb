# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :string
#

class ShortenedUrl < ApplicationRecord

  has_many :visits,
  primary_key: :id,
  foreign_key: :short_url_id,
  class_name: :Visit

  has_many :visitors,
  through: :short_url,
  source: :user

  validates :short_url, uniqueness: true, presence: true
  validates :long_url, uniqueness: true, presence: true

  def self.random_code

    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end
    code[0..15]
  end

  def self.generate_short_url(user, long_url)
    ShortenedUrl.create(user_id: user.id, short_url: self.random_code,long_url: long_url)
  end

  def submitter
    User.find_by_id(self.user_id)
  end
end
