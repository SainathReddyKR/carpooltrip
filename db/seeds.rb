# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Initial Data for Role
@admin = Role.create(name: "Admin")
@member = Role.create(name: "Member")
# # Admin
# User.create(email: "admin@ait.asia", password: "000000",
#             password_confirmation: "000000", role_id: @admin.id)
# # Member
# User.create(email: "member@ait.asia", password: "000000",
#             password_confirmation: "000000", role_id: @member.id)