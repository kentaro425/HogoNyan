class Request < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :user_rooms, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many_attached :request_images
  enum breed: {
    ー猫種を選択してくださいー: 0, 雑種: 1, ミヌエット: 2, アメリカンショートヘア: 3
  }

  enum size: {
    不明: 0, 大型: 1, 中型: 2, 小型: 3
  }

  enum sex: {
    unknown: 0, male: 1, female: 2
  }, _suffix: true

  enum vaccine: {
    unknown: 0, done: 1, not_yet: 2
  }, _suffix: true

  enum surgery: {
    unknown: 0, done: 1, not_yet: 2
  }, _suffix: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
