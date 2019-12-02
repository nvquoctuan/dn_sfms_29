User.create(full_name: "Example User", phone: "0964991298", email: "admin@soccer.vn", role: 0, activated: true, activated_at: Time.zone.now)
99.times do |n|
  name  = Faker::Name.name
  user_id = 1
  description = Faker::Name.name
  address = Faker::Address.street_address
  Pitch.create!(name: name, user_id: user_id, description: description, address: address)
end

SubpitchType.create!({name: "loai vip"})
pitches = Pitch.all
pitches.each{|pitch|
  5.times do |n|
    name = "Subpitch #{n}"
    desc = "Desc #{n}"
    price = 1000000
    size = "5 người"
    pitch.subpitches.create!({
             subpitch_type_id: 1,
             name: name,
             description: desc,
             price_per_hour: price,
             currency: "Đồng",
             size: size
    })
  end
}
