# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

def deleteAllUsers()
    User.destroy_all()
end
  

def create_random_data()

    raw_data = File.read('data.json')
    data = JSON.parse(raw_data)
    names = data['names']
    titles = data['title']
    description = data['description']

    names.each do |x|
        User.create(name: x, x+'_test@fakemail.com')
    end
    creators_size =  lenght(names)/3.floor)
    event_creators = Array.new(100) { rand(1...creators_size}

    event_creators.each do |x|
        User.find_by_name(names[x]).created_events.build(name: names[x],description[rand(lenght(names))],)
  end