class User < ActiveRecord::Base
  has_secure_password

  has_one :registration
  has_one :plan, through: :registration
  has_many :boxes, through: :plan

  validates_presence_of :first_name, :email

  after_create :create_plan

  # making sure not to override subscription
  def create_plan
    Plan.create(user_id: self.id) if plan.nil?
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def already_registered_for?(plan)
    Registration.where(user_id: self.id, plan_id: plan.id).present?
  end

  def admin?
    admin == true
  end

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.first_name = auth.info.name
    user.email = auth.info.email
    user.password = SecureRandom.hex(10)
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
end

  def self.create_user_from_omniauth(auth)
    puts " ! ! ! ! auth: #{auth.inspect}"
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      first_name: auth['info']['name']
    )
  end
end