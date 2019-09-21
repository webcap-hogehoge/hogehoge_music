# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Genre.create!(genre_name: "J-POP")
# Genre.create!(genre_name: "ROCK")
# Genre.create!(genre_name: "JAZZ")

# Product.create!(image_id: open("#{Rails.root}/db/fixture/img1.jpg"), price: 1000, product_status: 1, cd_name: "天気の子", is_deleted: 0, artist_name: "RADWIMPS", label_name: "sony", genre_id: 1)
# Product.create!(image_id: open("#{Rails.root}/db/fixture/img2.jpg"), price: 2000, product_status: 0, cd_name: "new chalenger", is_deleted: 0, artist_name: "AAA", label_name: "avex", genre_id: 1)
# Product.create!(image_id: open("#{Rails.root}/db/fixture/img3.jpg"), price: 3000, product_status: 1, cd_name: "こんなに", is_deleted: 0, artist_name: "日向坂４６", label_name: "victor", genre_id: 1)


# 100.times do |n|
# 	image_id = open("#{Rails.root}/db/fixture/img3.jpg")
# 	cd_name = Faker::Music.album
# 	price = Random.rand(1000..3000)
# 	product_status = Random.rand(0..1)
# 	is_deleted = 0
# 	label_name = ["sony", "avex", "victor", "ジェイ・ストーム", "渡辺音楽出版", "夢レコード", "hogehogeレコード"].sample
# 	artist_name = Faker::Music.band
# 	genre_id = Random.rand(1..3)
# 	Product.create!(image_id: image_id,
# 		            price: price,
# 		            product_status: product_status,
# 		            cd_name: cd_name,
# 		            is_deleted: is_deleted,
# 		            label_name: label_name,
# 		            artist_name: artist_name,
# 		            genre_id: genre_id,
# 		            )
# end

# EndUser.create!(last_name_kanji: "山田", first_name_kanji: "太郎", last_name_katakana: "ヤマダ", first_name_katakana: "タロウ", email: "sample@email.com", password: "password")

# CartItem.create!(product_id: 1, end_user_id: 1, product_number: 2)
# CartItem.create!(product_id: 2, end_user_id: 1, product_number: 3)

# Address.create!(end_user_id: 1, postal_code_1: 111, postal_code_2: 1111, address: "東京都渋谷区渋谷１−１−１", telephone_number: "111-1111-1111", last_name: "山田", first_name: "太郎", is_main:1)
# Address.create!(end_user_id: 1, postal_code_1: 222, postal_code_2: 2222, address: "東京都渋谷区渋谷２−２−２", telephone_number: "222-2222-2222", last_name: "山田", first_name: "二郎", is_main:0)
# Address.create!(end_user_id: 1, postal_code_1: 333, postal_code_2: 3333, address: "東京都渋谷区渋谷３−３−３", telephone_number: "333-3333-3333", last_name: "山田", first_name: "三郎", is_main:0)

OrderHistory.create!(id: 1, end_user_id: 1, last_name_kanji: "山本", first_name_kanji: "太郎", postal_code_1: "111", postal_code_2: "1111", address: "東京都渋谷区渋谷１−１−１", telephone_number: "111-1111-1111", pay_method: 1, order_status: 0, subtotal: 2000, tax: 160, delivery_fee: 500, total_price: 2660)
OrderHistory.create!(id: 2, end_user_id: 1, last_name_kanji: "佐々木", first_name_kanji: "小次郎", postal_code_1: "999", postal_code_2: "9999", address: "埼玉県　さいたま市　大宮区 1-1-1", telephone_number: "999-9999-9999", pay_method: 0, order_status: 1, subtotal: 4000, tax: 320, delivery_fee: 500, total_price: 4820)
OrderDetail.create!(order_history_id: 1, product_id: 1, product_number: 1, unit_price: 600)
OrderDetail.create!(order_history_id: 1, product_id: 2, product_number: 2, unit_price: 700)
OrderDetail.create!(order_history_id: 2, product_id: 3, product_number: 1, unit_price: 1000)
OrderDetail.create!(order_history_id: 2, product_id: 4, product_number: 3, unit_price: 1000)

CartItem.create!(product_id: 3, end_user_id: 1, product_number: 1)
CartItem.create!(product_id: 4, end_user_id: 1, product_number: 4)
CartItem.create!(product_id: 5, end_user_id: 1, product_number: 2)
CartItem.create!(product_id: 6, end_user_id: 1, product_number: 3)

