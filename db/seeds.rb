# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'



raw_data = File.read('app/assets/fakedata/data.json')
data = JSON.parse(raw_data)
names = data['names']
titles = data['titles']
descriptions = data['description']
locations = data['location']

names.each do |index, value|
    user = User.create(name: value, email: Faker::Internet.email)
    puts 'User: ', user.name, ' created.'
    puts 'User:id: ', user.id
    user.events.create(name: titles[index],
        description: descriptions[index],
        location: locations[index],
        date: [Faker::Date.between(from: 75.days.ago, to: Date.today),Faker::Date.forward(days: rand(75)) ].sample(1)[0])
    
    
        
end

creators_size =  names.length()/3.floor
event_creators = Array.new(100) { rand(1...creators_size)}
