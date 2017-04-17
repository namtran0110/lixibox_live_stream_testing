puts "seeding data"

# Begin Demo-Ready Seed Data
##
## USE THIS FORMULA TO ADD YOUR SEEDS. Put images in "seed_images" folder first.
##
puts "generating users..."
user01 = User.new password: "123123", email: "gatsby@example.com", username: "The Great Gatsby", avatar: File.new('seed_images/gatsby.jpg')

puts "saving users to database..."
user01.save


Store.update_all(description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde totam, tempora perferendis esse natus animi fuga sit voluptatibus inventore odit nihil cum quae ad provident debitis praesentium aspernatur laboriosam nulla eos assumenda iste, voluptatem obcaecati ipsa. Mollitia assumenda tempora earum deleniti quibusdam. Maxime tempora debitis est porro? Non, nobis, incidunt.")

puts "adding store cover photos..."
Store.find(user01.store.id).update(cover_photo: File.new('seed_images/gatsby_background.jpg'))

puts "generating categories..."
category01 = Category.new name: "Education", avatar: File.new('seed_images/ed.jpg')

puts "saving categories to database..."
category01.save

puts "generating products..."
Product.create store_id: user01.store.id, name: "Gatsby Mansion", price: 99999000, image: File.new('seed_images/gatsby_mension.jpg'),  description: "Gatsby Mansion", category_id: 6
Product.create store_id: user01.store.id, name: "Gatsby Car", price: 92000000, image: File.new('seed_images/gatsby_car.jpg'),  description: "The one that kill the cheating wife", category_id: 6
Product.create store_id: user01.store.id, name: "Gatsby watch", price: 52900000, image: File.new('seed_images/gatsby_watch.jpg'),  description: "The old sport", category_id: 6
Product.create store_id: user01.store.id, name: "Daisy' dress", price: 61000000, image: File.new('seed_images/daisy_dress.jpg'),  description: "The one and only", category_id: 6
Product.create store_id: user01.store.id, name: "Daisy' hat", price: 8800000, image: File.new('seed_images/daisy_hat.jpg'),  description: "The one and only", category_id: 6
Product.create store_id: user01.store.id, name: "Just spiderman", price: 0, image: File.new('seed_images/spiderman.jpg'),  description: "Just spiderman", category_id: 2

puts "generating Order statuses..."
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

puts " ======= SUCCESS ========"
puts " === Seeding Complete ==="