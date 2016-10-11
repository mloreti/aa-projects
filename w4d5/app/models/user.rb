class User < ActiveRecord::Base
  validates :email, :password_digest, presence:true
  validates :password, length: {minimum:6, allow_nil: true}
  after_initialize :ensure_session_token

  attr_reader :password

  has_many :posts,
    foreign_key: :author_id,
    class_name: :Post

  has_many :comments,
  foreign_key: :author_id,
  class_name: :Comment

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user
      user.is_password?(password) ? user : nil
    end
  end

  def generate_session_token
    SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    bc_obj = BCrypt::Password.new(self.password_digest)
    bc_obj.is_password?(password)
  end

  def reset_session_token!
    self.session_token = generate_session_token
  end

  private

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

end
