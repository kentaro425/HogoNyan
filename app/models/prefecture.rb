class Prefecture < ActiveHash::Base
  self.data = [
      { id: 1, name: '北海道', region_id: 1 }, { id: 2, name: '青森県', region_id: 2 }, { id: 3, name: '岩手県', region_id: 2 },
      { id: 4, name: '宮城県', region_id: 2 }, { id: 5, name: '秋田県', region_id: 2 }, { id: 6, name: '山形県', region_id: 2 },
      { id: 7, name: '福島県', region_id: 2 }, { id: 8, name: '茨城県', region_id: 3 }, { id: 9, name: '栃木県', region_id: 3 },
      { id: 10, name: '群馬県', region_id: 3 }, { id: 11, name: '埼玉県', region_id: 3 }, { id: 12, name: '千葉県', region_id: 3 },
      { id: 13, name: '東京都', region_id: 3 }, { id: 14, name: '神奈川県', region_id: 3 }, { id: 15, name: '新潟県', region_id: 4 },
      { id: 16, name: '富山県', region_id: 4 }, { id: 17, name: '石川県', region_id: 4 }, { id: 18, name: '福井県', region_id: 4 },
      { id: 19, name: '山梨県', region_id: 4 }, { id: 20, name: '長野県', region_id: 4 }, { id: 21, name: '岐阜県', region_id: 5 },
      { id: 22, name: '静岡県', region_id: 5 }, { id: 23, name: '愛知県', region_id: 5 }, { id: 24, name: '三重県', region_id: 5 },
      { id: 25, name: '滋賀県', region_id: 6 }, { id: 26, name: '京都府', region_id: 6 }, { id: 27, name: '大阪府', region_id: 6 },
      { id: 28, name: '兵庫県', region_id: 6 }, { id: 29, name: '奈良県', region_id: 6 }, { id: 30, name: '和歌山県', region_id: 6 },
      { id: 31, name: '鳥取県', region_id: 7 }, { id: 32, name: '島根県', region_id: 7 }, { id: 33, name: '岡山県', region_id: 7 },
      { id: 34, name: '広島県', region_id: 7 }, { id: 35, name: '山口県', region_id: 7 }, { id: 36, name: '徳島県', region_id: 8 },
      { id: 37, name: '香川県', region_id: 8 }, { id: 38, name: '愛媛県', region_id: 8 }, { id: 39, name: '高知県', region_id: 8 },
      { id: 40, name: '福岡県', region_id: 9 }, { id: 41, name: '佐賀県', region_id: 9 }, { id: 42, name: '長崎県', region_id: 9 },
      { id: 43, name: '熊本県', region_id: 9 }, { id: 44, name: '大分県', region_id: 9 }, { id: 45, name: '宮崎県', region_id: 9 },
      { id: 46, name: '鹿児島県', region_id: 9 }, { id: 47, name: '沖縄県', region_id: 9 },
  ]

  include ActiveHash::Associations
  belongs_to :region
  has_many :requests
end
