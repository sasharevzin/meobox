class User < ActiveRecord::Base
  attr_accessor :activation_token, :reset_token
  has_secure_password

  has_one :registration
  has_one :plan, through: :registration
  has_many :boxes, through: :plan

  validates_presence_of :first_name, :email

  after_create :create_plan
  # when user created plan must be created
  # do not override a plan
  def create_plan
    Plan.create(user_id: id) if plan.nil?
  end

   # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

   # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def already_registered_for?(plan)
    Registration.where(user_id: self.id, plan_id: plan.id).present?
  end

  def already_registered_for_any_plan?
    Registration.where(user_id: self.id).present?
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

  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end