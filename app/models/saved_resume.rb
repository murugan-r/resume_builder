class SavedResume < ApplicationRecord
  # Direct associations

  has_many   :sr_bullets,
             :foreign_key => "resume_id",
             :dependent => :destroy

  has_many   :sr_skills,
             :foreign_key => "resume_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
