class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  has_many :companies, dependent: :destroy

  enum role: %w(default admin)


end