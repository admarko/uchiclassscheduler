class Slot < ApplicationRecord
  # Direct associations

  belongs_to :schedule,
    :class_name => "Schedule",
    :foreign_key => "schedule_id"  #these were not put in?

  belongs_to :course,
             :class_name => "Course",
             :foreign_key => "course_id"

  # Indirect associations

  # Validations

end
