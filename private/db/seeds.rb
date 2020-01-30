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
    User.create(name: value, email: rand(9).to_s+rand(9).to_s+rand(9).to_s+rand(9).to_s+'_test@fakemail.com')
end

creators_size =  names.length()/3.floor
event_creators = Array.new(100) { rand(1...creators_size)}

event_creators.each do |x|
    User.find_by_name(names[x.to_s]).created_events.build(name: titles[x.to_s], description: descriptions[rand(names.length()).to_s], location: locations[x.to_s])
end
