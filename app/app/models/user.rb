class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  # Generate a magic login token
  def generate_token
    self.login_token = SecureRandom.urlsafe_base64(32)
    self.token_generated_at = Time.current
    save
    login_token
  end
  
  # Check if the token is valid (not expired)
  def valid_token?(token)
    return false if login_token.blank? || token.blank? || token_generated_at.blank?
    return false if token_generated_at < 30.minutes.ago
    
    # Use secure comparison to prevent timing attacks
    ActiveSupport::SecurityUtils.secure_compare(token, login_token)
  end
  
  # Invalidate the token after use
  def clear_token
    update(login_token: nil, token_generated_at: nil)
  end
  
  # Check if user is an admin
  def admin?
    admin
  end
end