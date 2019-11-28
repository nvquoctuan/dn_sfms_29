class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save{email.downcase!}
  before_create :create_activation_digest
  DATA_TYPE_USERS = %i(full_name email password password_confirmation).freeze
  DATA_TYPE_RESETS_PASSWORD = %i(password password_confirmation).freeze
  DATA_TYPE_UPDATE_PROFILE =
    %i(full_name phone gender password password_confirmation).freeze
  DATA_TYPE_UPDATE_PROFILE_PROVIDER = %i(full_name phone gender).freeze
  has_one_attached :avatar
  validates :full_name, presence: true,
    length: {maximum: Settings.name_in_users_max}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,
    length: {maximum: Settings.email_in_users_max},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false, scope: :provider}
  validates :uid, uniqueness: {scope: :provider}, allow_nil: true
  VALID_PHONE_REGEX = /\A[\d]{10,}\z/i.freeze
  validates :phone, format: {with: VALID_PHONE_REGEX}, allow_blank: true
  validates :gender, inclusion: {in: [true, false],
                                 message: "Gender is valid"}, allow_nil: true
  has_secure_password
  validates :password, presence: true, length:
    {minimum: Settings.password_min}, allow_nil: true
  validates :password, presence: true, length:
    {minimum: Settings.password_min}, on: :update_info

  enum role: {admin: 0, owner: 1, user: 2}

  class << self
    # Returns the hash digest of the given string.
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    # Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  # Returns true if the given token matches the digest.
  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password? token
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def activate
    update_attributes activated: true, activated_at: Time.zone.now
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_columns reset_digest: User.digest(reset_token),
                   reset_sent_at: Time.zone.now
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < Settings.timeout_reset_password.hours.ago
  end

  private

  def create_activation_digest
    return if provider

    self.activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
