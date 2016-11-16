class SrPurposeStatement < ApplicationRecord
  # Direct associations

  belongs_to :resume,
             :class_name => "SavedResume"

  belongs_to :purpose_statements

  # Indirect associations

  # Validations

end
