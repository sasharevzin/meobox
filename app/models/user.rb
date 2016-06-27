class User < ActiveRecord::Base
  has_one :registration
  has_one :plan, through: :registration

  has_secure_password

  validates_presence_of :first_name, :last_name, :email, :password_digest

  def already_registered_for?(plan)
    Registration.where(user_id: self.id, plan_id: plan.id).present?
  end

  def admin?
    admin == true
  end

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name']
    )
  end
end