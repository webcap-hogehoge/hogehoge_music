# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create!(image_id: open("#{Rails.root}/db/fixture/img1.jpg"), price: 1000, product_status: 1, cd_name: "天気の子", is_deleted: 0)
Product.create!(image_id: open("#{Rails.root}/db/fixture/img2.jpg"), price: 2000, product_status: 0, cd_name: "new chalenger", is_deleted: 0)
Product.create!(image_id: open("#{Rails.root}/db/fixture/img3.jpg"), price: 3000, product_status: 1, cd_name: "こんなに", is_deleted: 0)

100.times do |n|
	image_id = open("#{Rails.root}/db/fixture/img3.jpg")
	cd_name = Faker::Music.album
	price = Random.rand(1000..3000)
	product_status = Random.rand(0..1)
	is_deleted = Random.rand(0..1)
	Product.create!(image_id: image_id,
		            price: price,
		            product_status: product_status,
		            cd_name: cd_name,
		            is_deleted: is_deleted,
		            )
end





