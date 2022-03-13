class Post < ApplicationRecord
  belongs_to :user
  has_many :sns_favorites, dependent: :destroy
  has_many :favorite_users, through: :sns_favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :post_tags, dependent: :destroy
end
