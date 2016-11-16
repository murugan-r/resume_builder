class Bullet < ApplicationRecord
  # Direct associations

  has_many   :sr_bullets,
             :foreign_key => "bullets_id",
             :dependent => :destroy

  has_many   :bullet_tags,
             :dependent => :destroy

  belongs_to :organization

  # Indirect associations

  # Validations

end
