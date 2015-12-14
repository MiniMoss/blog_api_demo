class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :roles
  has_many :authentication_tokens

  before_save { self.email = email.downcase }

  validates :user_name,  presence: true, length: { maximum: 50 }
  validates :user_name,  uniqueness: true  #allow only one user_name to be "admin" for cancan ability.rb
  validates :role_ids,   presence: true

  #method for models/ability.rb to set cancan's role authorization
  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end
end
