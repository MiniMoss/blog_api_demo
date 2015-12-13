class Role < ActiveRecord::Base
  has_and_belongs_to_many :roles

  def role?( role )
    !roles.find_by_name( role.to_s.camelize ).nil?
  end
end
