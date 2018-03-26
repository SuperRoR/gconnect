class WevoUser < ApplicationRecord
  has_one :wevo_device
  has_many :orders
  belongs_to :role

  def is_admin?
    self.role.role_name == "Admin"
  end

  def self.admin_extension
    where(role: Role.find_by(role_name: "Admin")).first.extension
  end
end
