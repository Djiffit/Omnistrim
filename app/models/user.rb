class User < ActiveRecord::Base
  has_many :messages
  has_many :favorites, dependent: :destroy
  has_many :streams, through: :favorites
  has_many :memberships
  has_many :societies, through: :memberships
  has_secure_password
end
