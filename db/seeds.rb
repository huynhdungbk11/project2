User.create! name: "admin", email: "admin@gmail.com", password: "123456789",
password_confirmation: "123456789", role: 0
User.create! name: "huynhdung", email: "huynhdung@gmail.com", password: "123456789",
password_confirmation: "123456789", role: 1
User.create! name: "huynhdung1", email: "huynhdung1@gmail.com", password: "123456789",
password_confirmation: "123456789", role: 1

5.times do
  name  = Faker::Name.name
  description = Faker::Lorem.sentence(5)
  Category.create! name: name, description: description
end

categories = Category.take(5)
categories.each do |category|
  15.times do
    name = Faker::Lorem.sentence
    description = Faker::Lorem.sentence
    price = Faker::Number.number(6)
    Product.create! name: name, description: description, price: price,
      category_id: category.id
  end
end

user = User.find(id = 2)
15.times do
  name  = Faker::Name.name
  description = Faker::Lorem.sentence(2)
  message = Faker::Lorem.sentence(3)
  price = Faker::Number.number(6)
  Suggestion.create! name: name, description: description,
  message: message, price: price, user_id: user.id
end

user = User.find(id = 3)
5.times do
  name  = Faker::Name.name
  description = Faker::Lorem.sentence(2)
  message = Faker::Lorem.sentence(3)
  price = Faker::Number.number(6)
  Suggestion.create! name: name, description: description,
  message: message, price: price, user_id: user.id
end
