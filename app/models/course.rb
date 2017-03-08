class Course < ApplicationRecord
  # Direct associations

  has_many   :slots,
             :dependent => :destroy

  # Indirect associations

  has_many   :schedules,
             :through => :slots,
             :source => :schedule

  # Validations

end
