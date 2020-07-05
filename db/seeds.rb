countries = ['United Kingdom', 'United States', 'Spain', 'France', 'Germnay']
uk_countries = ['London', 'Manchester', 'Bristol', 'Liverpool', 'Glasgow', 'Cambridge']
dress_codes = ['Black & White', 'No shorts allowed', 'None', 'Tuxedo']

User.create(first_name: 'Hassan', last_name: 'Admin', email: 'admin@a.com', password: 'hassan')

countries.each do |country|
  country = Country.create!(name: country)
end

uk_countries.each do |city|
  city = City.create!(name: city, country_id: 1)
end

10.times do
  name = Faker::Company.name
  club = Club.create!(
    name: name,
    table_service: Faker::Boolean.boolean,
    address: Faker::Address.street_address,
    dress_code: dress_codes.sample,
    for_who: ['Public', 'Guest-list'].sample,
    website: Faker::Internet.domain_name(domain: name),
    instagram: "@#{name}",
    city: City.all.sample,
    user: User.first
    )


end
