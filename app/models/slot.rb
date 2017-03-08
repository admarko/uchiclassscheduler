class Slot < ApplicationRecord
  # Direct associations

  belongs_to :class,
             :class_name => "Course",
             :foreign_key => "course_id"

  # Indirect associations

  # Validations

end
