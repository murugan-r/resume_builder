class Skill < ApplicationRecord
  # Direct associations

  has_many   :sr_skills,
             :foreign_key => "skills_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
