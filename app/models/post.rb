class Post < ApplicationRecord
  belongs_to :user
  has_many :sns_favorites, dependent: :destroy
  has_many :favorite_users, through: :sns_favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many_attached :post_images

  def save_tag(sent_tags)
    # タグが存在していれば、全てのタグの名前を配列として取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 取得したタグから送られてきたタグを除いてold_tagsとする
    old_tags = current_tags - sent_tags
    # 送られてきたタグから取得したタグを除いてnew_tagsとする
    new_tags = sent_tags - current_tags

    # 古いタグを削除する
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    # 新しいタグを保存する
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end
end
