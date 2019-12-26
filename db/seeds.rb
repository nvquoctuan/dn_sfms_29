User.create!({full_name: "Example User", email: "admin@soccer.vn", password: "admin123", password_confirmation: "admin123", phone: "0964991298", role: 0, activated: true, activated_at: Time.zone.now})
User.create!({full_name: "Example User", email: "owner@soccer.vn", password: "admin123", password_confirmation: "admin123", phone: "0964991291", role: 1, activated: true, activated_at: Time.zone.now})

User.create!({full_name: "Example User", email: "user@soccer.vn", password: "admin123", password_confirmation: "admin123", phone: "0964992291", role: 2, activated: true, activated_at: Time.zone.now})

99.times do |n|
  name  = Faker::Name.name
  description = Faker::Lorem.sentence
  address = Faker::Address.street_address
  start_time = DateTime.strptime("05:30 +07:00", "%H:%M %z")
  end_time = DateTime.strptime("23:30 +07:00", "%H:%M %z")

  Pitch.create!(
    name: name,
    user_id: 2,
    description: description,
    country: "vn",
    address: address,
    phone: "111111111",
    city:Faker::Address.city,
    district: Faker::Address.state,
    start_time: start_time,
    end_time: end_time,
    limit: 2
  )
end

SubpitchType.create!({name: "loai vip", description: "mo ta loai vip"})

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

30.times do |n|
  Booking.create!({user_id: 2, subpitch_id: 2, start_time: Time.now, end_time: Time.now, message: "123", status: 0, total_price: 40000})
end
