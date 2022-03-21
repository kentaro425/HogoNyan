class Region < ActiveHash::Base
  self.data = [
      {id: 1, name: '北海道'}, {id: 2, name: '東北'}, {id: 3, name: '関東'},
      {id: 4, name: '甲信越/北陸'}, {id: 5, name: '中部/東海'}, {id: 6, name: '関西/近畿'},
      {id: 7, name: '中国'}, {id: 8, name: '四国'}, {id: 9, name: '九州'}
  ]

  include ActiveHash::Associations
  has_many :prefectures
  has_many :requests, through: :prefectures
end