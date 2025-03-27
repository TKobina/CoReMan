class User < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  has_many :entities, dependent: :destroy

  def set_defaults
    self.confirmed_email = false
  end
end
