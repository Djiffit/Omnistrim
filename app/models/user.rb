class User < ActiveRecord::Base
  has_many :messages
  has_many :favorites
  has_many :streams, through: :favorites
  has_secure_password
end
