# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Transaction.destroy_all
User.reset_pk_sequence
Transaction.reset_pk_sequence

benny = User.create(first_name: 'Benny', last_name: 'Louie', email: 'bennylouie1412@gmail.com', password: 'benben', balance: 5000.00)
kelvin = User.create(first_name: 'Kelvin', last_name: 'Louie', email: 'kelvinlouie30814@gmail.com', password: 'benben', balance: 5000.00)

buy1 = Transaction.create(user: benny, stock: 'IMB', price: '8.50', quantity: 6)
buy2 = Transaction.create(user: benny, stock: 'IMB', price: '8.00', quantity: 3)
buy3 = Transaction.create(user: benny, stock: 'FB', price: '8.50', quantity: 5)
buy4 = Transaction.create(user: benny, stock: 'FB', price: '8.50', quantity: 9)
buy5 = Transaction.create(user: benny, stock: 'DMV', price: '9.50', quantity: 2)

puts "It has been seeded!!! 🍀"
