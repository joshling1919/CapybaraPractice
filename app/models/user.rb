# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, :session_token, :username, presence: true
  validates :username, uniqueness: true

  after_initialize :ensure_session_token

  attr_reader :password

  has_many :goals,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Goal

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(12)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = self.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64(12)
    self.save

  end

end
