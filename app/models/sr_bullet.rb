class SrBullet < ApplicationRecord
  # Direct associations

  belongs_to :resume,
             :class_name => "SavedResume"

  belongs_to :bullets

  # Indirect associations

  # Validations

end
