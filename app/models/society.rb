class Society < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :messages
  belongs_to :user
  has_one :stream
  validates :name, uniqueness: true, length: {minimum: 5, maximum: 30}
  validates :abbreviation, uniqueness: true, length: {minimum: 3, maximum: 3}
  validates :description, length: {minimum: 3, maximum: 2000}
  validates :stream_id, presence: true
end
