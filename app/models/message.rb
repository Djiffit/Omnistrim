class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :society
  validates :content, length: {minimum:1, maximum:9000}
end
