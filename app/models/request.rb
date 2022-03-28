class Request < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :user_rooms, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many_attached :request_images
  enum breed: {
    雑種: 0,マンチカン: 1, ミヌエット: 2, アメリカンショートヘア: 3
  }

  enum size: {
    不明: 0, 大型: 1, 中型: 2, 小型: 3
  }

  enum status: {
    募集中: 0, 検討中: 1, 募集終了: 2, 里親決定済: 3
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

  def favorited_by?(user)
   favorites.where(user_id: user).exists?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :region, through: :prefecture
end
