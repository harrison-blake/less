class User < ApplicationRecord
  enum :role, [:customer, :contractor, :admin]

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, if: :password_required?

  after_initialize :set_default_role, if: :new_record?

  def password_required?
    new_record? || password.present?
  end

  def set_default_role
    self.role ||= :customer
  end
end
