# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'pry'

CONDITIONS = ["good", "okay", "great", "brand new", "like new", "pretty shitty", "good enough"]

30.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password")
  2.times do
    user.listings.create(
                        title: Faker::Lorem.sentence,
                        description: Faker::Lorem.paragraph,
                        condition: CONDITIONS.sample,
                        start_time: Faker::Time.between(2.days.ago, Time.now, :all),
                        end_time: Faker::Time.forward(23, :morning)
                        )
  end

  3.times do
    listing = Listing.where.not(user_id: user.id).first
    if listing
      user.bids.create(listing_id: listing.id, amount: Faker::Number.number(3))
    end
  end
end
