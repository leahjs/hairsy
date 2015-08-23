class User < ActiveRecord::Base
  has_secure_password

  #VAILDATIONS
  validates :email, confirmation: true
  validates :username, presence: true, uniqueness: true, :on => :create
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, :on => [:create]

  before_create :downcase_attributes


  private
  def downcase_attributes
    self.email.downcase!
    self.username.downcase!
  end
end
