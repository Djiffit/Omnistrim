class Stream < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites
  belongs_to :society
end
