class Favorite < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :stream, dependent: :destroy
end
