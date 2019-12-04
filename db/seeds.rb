User.create(full_name: "Example User", phone: "0964991298", email: "admin@soccer.vn", password: "123123", password_confirmation: "123123", role: 0, activated: true, activated_at: Time.zone.now)
99.times do |n|
  name  = Faker::Name.name
  user_id = 1
  description = Faker::Name.name
  address = Faker::Address.street_address
  Pitch.create!(name: name, user_id: user_id, description: description, address: address)
end
