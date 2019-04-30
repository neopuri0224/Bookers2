100.times do |n|
  name = Faker::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end

users = User.all
2.times do |n|
  title = Faker::Book.title
  category = Faker::Book.genre
  users.each { |user| user.books.create!(title: title,
                                         category: category,
  	                                    ) }
end