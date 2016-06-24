class User < ActiveRecord::Base
  belongs_to :plan
  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password_digest
end