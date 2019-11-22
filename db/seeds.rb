User.create!({full_name: "Example User", email: "admin@soccer.vn",
 password: "admin123", password_confirmation: "admin123", phone: "0964991298", role: 0,
              activated: true, activated_at: Time.zone.now})

99.times do |n|
  name  = Faker::Name.name
  user_id = 1
  description = Faker::Name.name
  address = Faker::Address.street_address
  Pitch.create!(name: name, user_id: user_id, description: description, address: address)
end
