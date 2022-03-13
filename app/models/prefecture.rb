class Prefecture < ApplicationRecord
  belongs_to :region
  has_many :requests, dependent: :destroy
end
