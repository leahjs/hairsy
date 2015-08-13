class User < ActiveRecord::Base
  has_secure_password
  # has_many :photos

  #VAILDATIONS
  validates :email, confirmation: true
  validates :email, :username, uniqueness: true
  validates :username, :email, :password, presence: true

  #METHODS
  # before_save :capitalize_attributes
  before_create :downcase_attributes


  private
    def capitalize_attributes
      # self.last_name.capitalize!
    end

    def downcase_attributes
      self.email.downcase!
      self.username.downcase!
    end


end
