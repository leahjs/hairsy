class User < ActiveRecord::Base
  has_secure_password

  #VAILDATIONS
  validates :email, confirmation: true
  validates :username, :email, uniqueness: true
  validates :password, :email, :username, presence: true
  
  before_create :downcase_attributes


  private
  def downcase_attributes
    self.email.downcase!
    self.username.downcase!
  end
end
