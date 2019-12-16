User.create!({full_name: "Example User", email: "admin@soccer.vn", password: "admin123", password_confirmation: "admin123", phone: "0964991298", role: 0, activated: true, activated_at: Time.zone.now})
User.create!({full_name: "Example User", email: "owner@soccer.vn", password: "admin123", password_confirmation: "admin123", phone: "0964991291", role: 1, activated: true, activated_at: Time.zone.now})

User.create!({full_name: "Example User", email: "user@soccer.vn", password: "admin123", password_confirmation: "admin123", phone: "0964992291", role: 2, activated: true, activated_at: Time.zone.now})

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
SubpitchType.create!({name: "loai vip", description: "mo ta loai vip"})

pitches = Pitch.all
pitches.each do |pitch|
  name  = Faker::Name.name
  user_id = 1
  description = Faker::Name.name
  address = Faker::Address.street_address
  Subpitch.create!(name: name, description: description, pitch_id: pitch.id, subpitch_type_id: 1)
end
