puts "seeding data"

# Begin Demo-Ready Seed Data
##
## USE THIS FORMULA TO ADD YOUR SEEDS. Put images in "seed_images" folder first.
##
puts "generating users..."
user01 = User.new password: "123123", email: "gatsby@example.com", username: "The Great Gatsby", avatar: File.new('seed_images/gatsby.jpg')
user02 = User.new password: "123123", email: "tlock@example.com", username: "TLock", avatar: File.new('seed_images/tlock.jpg')
user03 = User.new password: "123123", email: "wholefood@example.com", username: "Whole Foods", avatar: File.new('seed_images/whole_foods.jpg')
user04 = User.new password: "123123", email: "cena@gmail.com", username: "John Cena", avatar:File.new('seed_images/cena.jpg')
user05 = User.new password: "123123", email: "namtran0110@gmail.com", username: "Nam Tran", avatar:File.new('seed_images/founder.jpg')
user06 = User.new password: "123123", email: "hutieu@gmail.com", username: "Anh Ba", avatar:File.new('seed_images/anh_ba.jpg')
user07 = User.new password: "123123", email: "harley@gmail.com", username: "Harley Trung", avatar:File.new('seed_images/harley.jpg')
user08 = User.new password: "123123", email: "chang@gmail.com", username: "Changmakeup", avatar:File.new('seed_images/changmakeup.jpg')
user09 = User.new password: "123123", email: "steve@gmail.com", username: "Steve Jobs", avatar:File.new('seed_images/steve.jpg')
user10 = User.new password: "123123", email: "ricknmorty@gmail.com", username: "Rick & Morty", avatar:File.new('seed_images/rick.jpg')
user11 = User.new password: "123123", email: "ssp@gmail.com", username: "Saigon Soul Pool Party", avatar:File.new('seed_images/ssp.jpg')
user12 = User.new password: "123123", email: "wow@gmail.com", username: "World Of Warcraft", avatar:File.new('seed_images/wow_user.jpg')
user13 = User.new password: "123123", email: "f@gmail.com", username: "F Fashion", avatar:File.new('seed_images/fashion.jpg')
user14 = User.new password: "123123", email: "ralph@gmail.com", username: "Ralph Lauren", avatar:File.new('seed_images/the_legend_himself.jpg')

puts "saving users to database..."
user01.save
user02.save
user03.save
user04.save
user05.save
user06.save
user07.save
user08.save
user09.save
user10.save
user11.save
user12.save
user13.save
user14.save

Store.update_all(description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde totam, tempora perferendis esse natus animi fuga sit voluptatibus inventore odit nihil cum quae ad provident debitis praesentium aspernatur laboriosam nulla eos assumenda iste, voluptatem obcaecati ipsa. Mollitia assumenda tempora earum deleniti quibusdam. Maxime tempora debitis est porro? Non, nobis, incidunt.")

puts "linking subscriptions..."
# This step is optional
Follow.create following_id: user02.id, follower_id: user01.id
Follow.create following_id: user03.id, follower_id: user02.id
Follow.create following_id: user01.id, follower_id: user03.id

puts "adding store cover photos..."
Store.find(user01.store.id).update(cover_photo: File.new('seed_images/gatsby_background.jpg'))
Store.find(user02.store.id).update(cover_photo: File.new('seed_images/tlock_cover.jpg'))
Store.find(user03.store.id).update(cover_photo: File.new('seed_images/whole_foods_cover.jpg'))
Store.find(user04.store.id).update(cover_photo: File.new('seed_images/cena_background.jpg'))
Store.find(user05.store.id).update(cover_photo: File.new('seed_images/nam_cover.jpg'))
Store.find(user06.store.id).update(cover_photo: File.new('seed_images/ban_hu_tieu.jpg'))
Store.find(user07.store.id).update(cover_photo: File.new('seed_images/trung_cover.jpg'))
Store.find(user08.store.id).update(cover_photo: File.new('seed_images/changmakeup_cover.jpg'))
Store.find(user09.store.id).update(cover_photo: File.new('seed_images/apple.jpg'))
Store.find(user10.store.id).update(cover_photo: File.new('seed_images/ricknmorty.jpg'))
Store.find(user11.store.id).update(cover_photo: File.new('seed_images/ssp_background.jpg'))
Store.find(user12.store.id).update(cover_photo: File.new('seed_images/wow.jpg'))
Store.find(user13.store.id).update(cover_photo: File.new('seed_images/fashion_background.jpg'))
Store.find(user14.store.id).update(cover_photo: File.new('seed_images/PRL.jpg'))

puts "generating categories..."
category01 = Category.new name: "Education", avatar: File.new('seed_images/ed.jpg')
category02 = Category.new name: "Entertainment", avatar: File.new('seed_images/entertainment.jpg')
category03 = Category.new name: "Food", avatar: File.new('seed_images/food.jpg')
category04 = Category.new name: "Technology", avatar: File.new('seed_images/technology.jpg')
category05 = Category.new name: "Fashion", avatar: File.new('seed_images/fashion_cat.jpg')
category06 = Category.new name: "Luxury", avatar: File.new('seed_images/luxury_cat.jpg')

puts "saving categories to database..."
category01.save
category02.save
category03.save
category04.save
category05.save
category06.save

puts "generating products..."
Product.create store_id: user01.store.id, name: "Gatsby Mansion", price: 99999000, image: File.new('seed_images/gatsby_mension.jpg'),  description: "Gatsby Mansion", category_id: 6
Product.create store_id: user01.store.id, name: "Gatsby Car", price: 92000000, image: File.new('seed_images/gatsby_car.jpg'),  description: "The one that kill the cheating wife", category_id: 6
Product.create store_id: user01.store.id, name: "Gatsby watch", price: 52900000, image: File.new('seed_images/gatsby_watch.jpg'),  description: "The old sport", category_id: 6
Product.create store_id: user01.store.id, name: "Daisy' dress", price: 61000000, image: File.new('seed_images/daisy_dress.jpg'),  description: "The one and only", category_id: 6
Product.create store_id: user01.store.id, name: "Daisy' hat", price: 8800000, image: File.new('seed_images/daisy_hat.jpg'),  description: "The one and only", category_id: 6
Product.create store_id: user01.store.id, name: "Just spiderman", price: 0, image: File.new('seed_images/spiderman.jpg'),  description: "Just spiderman", category_id: 2

Product.create store_id: user02.store.id, name: "Honda Wave RSX", price: 24490000, image: File.new('seed_images/wave.png'),  description: "The best wave you can ride", category_id: 4
Product.create store_id: user02.store.id, name: "Full Face Helmet", price: 400000, image: File.new('seed_images/fullface.jpg'),  description: "Play Safe", category_id: 4
Product.create store_id: user02.store.id, name: "3/4 Helmet", price: 200000, image: File.new('seed_images/threequarter.jpg'),  description: "Protection For Your Head", category_id: 4

Product.create store_id: user03.store.id, name: "Xoai", price: 15000, image: File.new('seed_images/xoai.jpg'),  description: "Mango Loco", category_id: 3
Product.create store_id: user03.store.id, name: "Dau", price: 10000, image: File.new('seed_images/dau.jpg'),  description: "Strawberry! Honey", category_id: 3
Product.create store_id: user03.store.id, name: "Viet Quat", price: 10000, image: File.new('seed_images/vietquat.jpg'),  description: "Raspberry Baby!", category_id: 3
Product.create store_id: user03.store.id, name: "Dua", price: 20000, image: File.new('seed_images/dua.jpg'),  description: "Coco nutz", category_id: 3

Product.create store_id: user04.store.id, name: "WWE Belt", price:120000000, image: File.new('seed_images/wwe.jpg'), description: "The only true champion with the belt", category_id: 2
Product.create store_id: user04.store.id, name: "John Cena House", price:770000000, image: File.new('seed_images/cena_house.jpg'), description: "The Beautiful Condo Near The Beach", category_id: 6
Product.create store_id: user04.store.id, name: "U Can't See Me", price: 60000, image: File.new('seed_images/cena_hat.jpg'), description: "U Can't See Me", category_id: 2

Product.create store_id: user05.store.id, name: "Vespa", price:59000000, image: File.new('seed_images/vespa.jpg'), description: "Cool Bike", category_id: 4
Product.create store_id: user05.store.id, name: "Audi A5", price:755000000, image: File.new('seed_images/2016-audi-a5.jpg'), description: "The Best Car In The World", category_id: 4
Product.create store_id: user05.store.id, name: "Tesla Model X", price: 949000000, image: File.new('seed_images/2016-Tesla-Model-X-P90D.jpg'), description: "You Don't Need To Drive Anymore", category_id: 4

Product.create store_id: user06.store.id, name: "Hu tieu Nam Vang", price: 40000, image: File.new('seed_images/nam_vang.jpg'), description: "Hu tieu re ngon", category_id: 3
Product.create store_id: user06.store.id, name: "Hu tieu xuong", price: 40000, image: File.new('seed_images/hu_tieu_xuong.jpg'), description: "Hu tieu re ngon", category_id: 3
Product.create store_id: user06.store.id, name: "Hu tieu kho", price: 40000, image: File.new('seed_images/hu_tieu_kho.jpg'), description: "Hu tieu re ngon", category_id: 3

Product.create store_id: user07.store.id, name: "Rails videos", price: 1400000, image: File.new('seed_images/rails.jpg'), description: "The best tutorial course you can get", category_id: 1
Product.create store_id: user07.store.id, name: "Swift iOS videos", price: 1100000, image: File.new('seed_images/swift.jpg'), description: "The best tutorial course you can get", category_id: 1

Product.create store_id: user08.store.id, name: "3CE Mood Recipe Matte Lip Color", price: 290000, image: File.new('seed_images/3ce.jpg'), description: "Beauty Product", category_id: 1
Product.create store_id: user08.store.id, name: "Shiseido Rouge Rouge Lipsticks", price: 270000, image: File.new('seed_images/shiseido.jpg'), description: "Beauty Product", category_id: 1

Product.create store_id: user09.store.id, name: "Macbook Pro Retina", price: 27900000, image: File.new('seed_images/macbook.jpg'), description: "Designed by the best, Produced by the top, Created for the common", category_id: 4
Product.create store_id: user09.store.id, name: "iPhone 5", price: 1870000, image: File.new('seed_images/iphone.jpg'), description: "Designed by the best, Produced by the top, Created for the common", category_id: 4
Product.create store_id: user09.store.id, name: "iPod", price: 970000, image: File.new('seed_images/ipod.jpg'), description: "Designed by the best, Produced by the top, Created for the common", category_id: 4

Product.create store_id: user10.store.id, name: "Spaceship", price: 122000000, image: File.new('seed_images/spaceship.jpg'), description: "Come with inception battery", category_id: 2
Product.create store_id: user10.store.id, name: "Plumbus", price: 810000, image: File.new('seed_images/plumbus.jpg'), description: "I don't even know wtf this is", category_id: 2
Product.create store_id: user10.store.id, name: "Meeseeks", price: 1000000, image: File.new('seed_images/meeseeks.jpg'), description: "Do what you order till I die", category_id: 2

Product.create store_id: user11.store.id, name: "Ticket", price: 150000, image: File.new('seed_images/ssp_ticket.jpg'), description: "Come And Have Some Fun With Us!", category_id: 2

Product.create store_id: user12.store.id, name: "Sword Of Hero", price: 250000, image: File.new('seed_images/sword1.jpg'), description: "Sword of Hero", category_id: 2
Product.create store_id: user12.store.id, name: "Legend's dagger", price: 350000, image: File.new('seed_images/sword2.jpg'), description: "Sword of Legend", category_id: 2
Product.create store_id: user12.store.id, name: "Smash the world", price: 450000, image: File.new('seed_images/sword3.jpg'), description: "Only for Gods", category_id: 2

Product.create store_id: user13.store.id, name: "Robot Vietnam Next Top Model", price: 490000, image: File.new('seed_images/event_1.jpg'), description: "Fashion in the eyes of 0101", category_id: 5
Product.create store_id: user13.store.id, name: "White Blouse Event", price: 910000, image: File.new('seed_images/event_2.jpg'), description: "All Whites", category_id: 5

Product.create store_id: user14.store.id, name: "Long Coat", price: 854000, image: File.new('seed_images/PRL1.jpg'), description: "Fashionably beautiful", category_id: 5
Product.create store_id: user14.store.id, name: "Pants", price: 614000, image: File.new('seed_images/PRL2.jpg'), description: "Looking good for single life", category_id: 5
Product.create store_id: user14.store.id, name: "Long Sleeves", price: 814000, image: File.new('seed_images/PRL3.jpg'), description: "The one Trump would approve", category_id: 5

puts "generating Order statuses..."
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

puts " ======= SUCCESS ========"
puts " === Seeding Complete ==="