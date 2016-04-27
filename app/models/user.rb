class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :username, uniqueness: true
  validates :session_token, uniqueness: true

  def self.find_by_credentials(username, password)
    user = User.find_by_username(usernaem)
    if user
      user.correct_password?(password) ? (return user) : (return nil)
    end

    nil
  end

  def self.generate_session_token
    SecureRandom::usersafe_base64(16)
  end

  def correct_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
