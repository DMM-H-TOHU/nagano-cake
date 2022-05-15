# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer = Customer.new(:email => 'customer@email.com', :password => 'password', :first_name => '太郎', :familly_name => 'ユーザー', :first_name_kana => 'タロウ', :familly_name_kana => 'ユーザー', :zipcode => '0000000', :address => '東京都新宿区新宿3-1-1', :telephone_number => '07012345678')
customer.save!