Customer.create!(
  email: "test@example.com",
  password: "000000",
  last_name: "佐藤",
  first_name: "花子",
  last_name_kana: "サトウ",
  first_name_kana: "ハナコ",
  postal_code: "1000001", 
  address: "東京都新宿区1-2-3",
  phone_number: "09012345678" 
)


Customer.create!(
  email: "raijin@example.com",
  password: "123456",
  last_name: "轟",
  first_name: "雷神",
  last_name_kana: "トドロキ",
  first_name_kana: "ライジン",
  postal_code: "2000002",
  address: "大阪府大阪市中央区2-3-4",
  phone_number: "08098765432"
)


genre1 = Genre.create!(genre_name: "チョコレート")
genre2 = Genre.create!(genre_name: "フルーツ")


item1 = Item.create!(
  genre_id: 1,
  name: "ガトーショコラ",
  introduction: "濃厚なチョコレートケーキ",
  price: 1500,
  is_active: true
)

item2 = Item.create!(
  genre_id: 2,
  name: "ストロベリーショートケーキ",
  introduction: "ふわふわスポンジといちごの組み合わせ",
  price: 1200,
  is_active: true
)

item3 = Item.create!(
  genre_id: 2,
  name: "マンゴームース",
  introduction: "なめらかで甘酸っぱいマンゴーのムース",
  price: 1300,
  is_active: true
)

CartItem.create!(customer_id: 1, item_id: item1.id, amount: 2)
CartItem.create!(customer_id: 1, item_id: item3.id, amount: 1)

address1 = Address.create!(
  customer_id: 1,
  postal_code: "1000001",
  address: "東京都千代田区千代田1-1",
  name: "山田 太郎"
)

address2 = Address.create!(
  customer_id: 1,
  postal_code: "1000002",
  address: "東京都港区赤坂1-2-3",
  name: "山田 花子"
)

order = Order.create!(
  customer_id: 1,
  payment_method: 0,  # クレジットカード
  postal_code: address1.postal_code,
  address: address1.address,
  name: address1.name,
  shopping_cost: 500,
  total_payment: 3500,
  status: 0 
)

OrderDetail.create!(
  order_id: order.id,
  item_id: item1.id,  # ガトーショコラ
  price: item1.price,
  amount: 1,
  making_status: 0  # 製造不可
)

OrderDetail.create!(
  order_id: order.id,
  item_id: item2.id,  # ストロベリーショートケーキ
  price: item2.price,
  amount: 2,
  making_status: 1  # 制作待ち
)

Admin.create!(
  email: 'admin@a',
  password: '000000'
)

