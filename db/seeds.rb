User.create!(full_name: "Example User", email: "example@railstutorial.org", phone: "0964991298")
Pitch.create!(name: "San bong 1", country: "Viet nam", city: "Đà Nẵng", district: "Hải Châu", address: "16 Lý Thường Kiệt")

99.times do |n|
  name  = Faker::Name.name
  user_id = 1
  description = Faker::Name.name
  address = Faker::Address.street_address
  Pitch.create!(name: name, user_id: user_id, description: description, address: address)
end
