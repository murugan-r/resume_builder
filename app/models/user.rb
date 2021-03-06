class User < ApplicationRecord
  # Direct associations

  has_many   :saved_resumes,
             :dependent => :destroy

  has_many   :organizations,
             :dependent => :destroy

  has_many   :skills,
             :dependent => :destroy

  has_many   :purpose_statements,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
