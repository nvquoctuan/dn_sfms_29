User.create!({full_name: "Example User", email: "admin@soccer.vn",
 password: "admin123", password_confirmation: "admin123", phone: "0964991298", role: 0,
              activated: true, activated_at: Time.zone.now})
User.create!({full_name: "Owner User", email: "owner@soccer.vn",
 password: "admin123", password_confirmation: "admin123", phone: "0962991298", role: 1,
              activated: true, activated_at: Time.zone.now})
99.times do |n|
  name  = Faker::Name.name
  user_id = 1
  description = Faker::Name.name
  address = Faker::Address.street_address
  Pitch.create!(name: name, user_id: user_id, description: description, address: address)
end

10.times do |n|
  name  = Faker::Name.name
  user_id = 2
  description = Faker::Name.name
  address = Faker::Address.street_address
  Pitch.create!(name: name, user_id: user_id, description: description, address: address)
end

SubpitchType.create!({name: "Subpitch type 1", description: "Mo ta 1"})

50.times do |n|
  name = "Subpitch _ #{n}"
  Subpitch.create!({name: name, description: "mo ta 1",status: 0,pitch_id: 1,price_per_hour: 30000, currency: "Dong", picture: "", size: "5 nguoi", subpitch_type_id: 1, created_at: Time.now, updated_at: Time.now})
end

10.times do |n|
  name = "Subpitch _ #{n}"
  Subpitch.create!({name: name, description: "mo ta 1",status: 0,pitch_id: 100,price_per_hour: 30000, currency: "Dong", picture: "", size: "5 nguoi", subpitch_type_id: 1, created_at: Time.now, updated_at: Time.now})
end


50.times do |n|
  Booking.create!({user_id: 1, subpitch_id: 2, start_time: Time.now, end_time: Time.now, message: "hello moi nguoi", status: 0, total_price: 50000})
end

10.times do |n|
  Booking.create!({user_id: 2, subpitch_id: 51, start_time: Time.now, end_time: Time.now, message: "hello moi nguoi", status: 0, total_price: 50000})
end
