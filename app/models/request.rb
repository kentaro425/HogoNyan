class Request < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :user_rooms, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
