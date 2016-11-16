class SrSkill < ApplicationRecord
  # Direct associations

  belongs_to :resume,
             :class_name => "SavedResume"

  belongs_to :skills

  # Indirect associations

  # Validations

end
