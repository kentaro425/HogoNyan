class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :request
end
