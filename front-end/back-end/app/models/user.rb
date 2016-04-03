class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def ensure_authentication_token
    self.authentication_token = generate_authentication_token
    self.save!
    self.authentication_token
  end

  private

  def generate_authentication_token
    loop do
     token = Devise.friendly_token
     break token unless User.where(authentication_token: token).first
   end
 end
 
 has_many :streams, dependent: :destroy
end
