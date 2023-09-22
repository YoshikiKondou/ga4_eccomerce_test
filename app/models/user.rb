class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :age, numericality: { greater_than: 1, less_than: 110 }, allow_blank: true
  validates :email, presence: true, uniqueness: true
  validates :pref, presence: true
  validates :sex, presence:true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password_digest, presence: true, length: { minimum: 6 }, on: :create
end
