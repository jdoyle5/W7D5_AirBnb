# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  birth_date  :date             not null
#  color       :string
#  sex         :string(1)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :name, :birth_date, :color, :sex, :description, presence: true
  COLORS = %w(white brown orange black multi-color).freeze

  validates :color, inclusion: { in: COLORS,
    message: "That is not a valid color!!" }
  validates :sex, inclusion: { in: %w(M F),
    message: "That is not a valid sex!!" }

  def age
    time_ago_in_words(birth_date)
  end

end
