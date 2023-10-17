# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
##   Character.create(name: "Luke", movie: movies.first)
r1 = Role.create({ id: 9, name: 'Tourist', description: 'Can search for guides, normal user' })
r2 = Role.create({ id: 10, name: 'Guide', description: 'Can post tour announcements and do his job on the platform' })


