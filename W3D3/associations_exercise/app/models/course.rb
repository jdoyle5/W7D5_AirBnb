# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord
  has_many :enrollments,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: 'Enrollment'

  has_many :users,
  through: :enrollments,
  source: :user

  has_one :prereq,
  primary_key: :id,
  foreign_key: :prereq_id,
  class_name: 'Course'

  belongs_to :requires_prereq,
  class_name: 'Course',
  foreign_key: :prereq_id

  belongs_to :instructor,
  class_name: 'User'


end
