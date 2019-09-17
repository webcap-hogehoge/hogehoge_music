# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Artist.create!(artist_name: "RADWIMPS")
Artist.create!(artist_name: "AAA")
Artist.create!(artist_name: "日向坂４６")


Label.create!(label_name: "sony")
Label.create!(label_name: "avex")
Label.create!(label_name: "victor")
Label.create!(label_name: "ジェイ・ストーム")
Label.create!(label_name: "渡辺音楽出版")
Label.create!(label_name: "夢レコード")
Label.create!(label_name: "hogehogeレコード")

Product.create!(image_id: open("#{Rails.root}/db/fixture/img1.jpg"), price: 1000, product_status: 1, cd_name: "天気の子", is_deleted: 0, artist_id: 1, label_id: 1)
Product.create!(image_id: open("#{Rails.root}/db/fixture/img2.jpg"), price: 2000, product_status: 0, cd_name: "new chalenger", is_deleted: 0, artist_id: 2, label_id: 2)
Product.create!(image_id: open("#{Rails.root}/db/fixture/img3.jpg"), price: 3000, product_status: 1, cd_name: "こんなに", is_deleted: 0, artist_id: 3, label_id: 3)


100.times do |n|
	image_id = open("#{Rails.root}/db/fixture/img3.jpg")
	cd_name = Faker::Music.album
	price = Random.rand(1000..3000)
	product_status = Random.rand(0..1)
	is_deleted = 0
	label_id = Random.rand(1..7)
	artist_id = Random.rand(1..3)
	Product.create!(image_id: image_id,
		            price: price,
		            product_status: product_status,
		            cd_name: cd_name,
		            is_deleted: is_deleted,
		            label_id: label_id,
		            artist_id: artist_id,
		            )


CartItem.create!(product_id: 1, end_user_id: 1, product_number: 2)
CartItem.create!(product_id: 2, end_user_id: 1, product_number: 3)

Address.create!(end_user_id: 1, postal_code_1: 111, postal_code_2: 1111, address: "東京都渋谷区渋谷１−１−１", telephone_number: "111-1111-1111", last_name: "山田", first_name: "太郎", is_main:1)
Address.create!(end_user_id: 1, postal_code_1: 222, postal_code_2: 2222, address: "東京都渋谷区渋谷２−２−２", telephone_number: "222-2222-2222", last_name: "山田", first_name: "二郎", is_main:0)
Address.create!(end_user_id: 1, postal_code_1: 333, postal_code_2: 3333, address: "東京都渋谷区渋谷３−３−３", telephone_number: "333-3333-3333", last_name: "山田", first_name: "三郎", is_main:0)



end