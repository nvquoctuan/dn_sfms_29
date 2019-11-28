User.create!(full_name: "Example User", password: "admin123", password_confirmation: "admin123", activated: true, email: "admin@soccer.vn", phone: "0964991298")
User.create!(full_name: " User 2", password: "admin123", password_confirmation: "admin123", activated: true, email: "user2@soccer.vn", phone: "0964191298")

99.times do |n|
  name  = Faker::Name.name
  user_id = 1
  description = Faker::Name.name
  address = Faker::Address.street_address
  Pitch.create!({user_id: 1,
           name: name,
           description: description,
           country: "VN",
           city: "Da nang",
           phone: "5555555555",
           district: "Hai chau",
           address: address,
           limit: 2})
end

5.times do |n|
  name  = Faker::Name.name
  description = Faker::Name.name
  address = Faker::Address.street_address
  Pitch.create!({user_id: 2,
           name: name,
           description: description,
           country: "vn",
           city: "Da nang",
           phone: "5555555555",
           district: "Hai chau",
           address: address,
           limit: 2})
end
SubpitchType.create!({name:  "SubpitchType 1",
           description: "Day la mot ta 1"})

50.times do |n|
  name = "Subpitch_#{n}"
  desc = "Day la mot ta #{n}"
  size = "5 người"

  Subpitch.create!({
           name: name,
           description: desc,
           pitch_id: 1,
           price_per_hour: 1000000.0,
           size: size,
           subpitch_type_id: 1})
end

30.times do |n|
  Booking.create!({user_id: 1, subpitch_id: 2, start_time: Time.now, end_time: Time.now, message: "123", status: 2, total_price: 50000})
end
