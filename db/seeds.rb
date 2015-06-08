# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!( name: 'Ben Borchard', 
			 email: 'ben.borchard@gmail.com', 
			 priv_level: 1, 
			 password: 'crazypassdawg',
			 password_digest: '$2a$10$LT192MIPxXnh5W4n6aYEsez9n7MHK7PsJ8zS5U1Wb6WLRookGW8XO')
