# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: "admin@admin", password: "psadmin")

Category.create(category_name: "ファッション")
Category.create(category_name: "コスメ/美容")
Category.create(category_name: "インテリア")
Category.create(category_name: "エンタメ/ホビー")
Category.create(category_name: "楽器")
Category.create(category_name: "日用品")
Category.create(category_name: "家電")
Category.create(category_name: "オーディオ機器")
Category.create(category_name: "その他")
