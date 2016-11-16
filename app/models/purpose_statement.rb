class PurposeStatement < ApplicationRecord
  # Direct associations

  has_many   :sr_purpose_statements,
             :foreign_key => "purpose_statements_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
