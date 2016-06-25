class User < ActiveRecord::Base
  has_one :registration
  has_one :plan, through: :registration

  has_secure_password

  validates_presence_of :first_name, :last_name, :email, :password_digest
end