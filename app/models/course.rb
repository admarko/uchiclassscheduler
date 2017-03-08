class Course < ApplicationRecord
  # Direct associations

  has_many   :slots,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
