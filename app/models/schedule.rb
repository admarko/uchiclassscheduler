class Schedule < ApplicationRecord
  # Direct associations

  has_many   :slots,
             :dependent => :destroy

  belongs_to :student,
             :class_name => "User",
             :foreign_key => "user_id"

  # Indirect associations

  has_many   :classes,
             :through => :slots,
             :source => :class

  # Validations

end
