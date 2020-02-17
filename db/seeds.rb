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

buy1 = Transaction.create(user: benny, stock: 'IBM', price: '8.50', quantity: 6)
buy2 = Transaction.create(user: benny, stock: 'IBM', price: '8.00', quantity: 3)
buy3 = Transaction.create(user: benny, stock: 'FB', price: '8.50', quantity: 5)
buy4 = Transaction.create(user: benny, stock: 'FB', price: '8.50', quantity: 9)
buy5 = Transaction.create(user: benny, stock: 'ABC', price: '9.50', quantity: 2)
buy6 = Transaction.create(user: benny, stock: 'AA', price: '9.50', quantity: 2)
buy7 = Transaction.create(user: benny, stock: 'MRAM', price: '9.50', quantity: 2)
buy8 = Transaction.create(user: benny, stock: 'GLOG', price: '9.50', quantity: 2)
buy9 = Transaction.create(user: benny, stock: 'GLO', price: '9.50', quantity: 2)
buy10 = Transaction.create(user: benny, stock: 'MRC', price: '9.50', quantity: 2)
buy11 = Transaction.create(user: benny, stock: 'AAPL', price: '9.50', quantity: 2)
buy12 = Transaction.create(user: benny, stock: 'MTG', price: '9.50', quantity: 2)
buy13 = Transaction.create(user: benny, stock: 'MTEX', price: '9.50', quantity: 2)
buy14 = Transaction.create(user: benny, stock: 'MZA', price: '9.50', quantity: 2)
buy15 = Transaction.create(user: benny, stock: 'NSL', price: '9.50', quantity: 2)

puts "It has been seeded!!! 🍀"
