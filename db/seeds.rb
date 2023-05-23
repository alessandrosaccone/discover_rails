# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

r1 = Role.create({ id: 9, name: 'Tourist', description: 'Can search for guides, normal user' })
r2 = Role.create({ id: 10, name: 'Guide', description: 'Can post tour announcements and do his job on the platform' })

u1 = User.create({ name: 'Sally', email: 'sally@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r1.id })
u2 = User.create({ name: 'Sue', email: 'sue@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u3 = User.create({ name: 'Kev', email: 'kev@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u4 = User.create({ name: 'Jack', email: 'jack@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r1.id})
u4 = User.create({ name: 'Jacke', email: 'jacke@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id})
u5 = User.create({ name: 'Jackel', email: 'jackel@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: 10, lat: 41.9079616, long: 12.514760, stripe_account_id: 'acct_1N74unPLkNCoVoUm'})
u5 = User.create({ name: 'Alesacco', email: 'alessandrosaccone96@gmail.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r1.id})
l1=Language.create(name: "Francese")
l2=Language.create(name:"Italiano")
l3=Language.create(name:"Inglese")

c1=City.create(name: "Roma", region: "Lazio")
c2=City.create(name: "Frosinone", region: "Lazio")

p1 = Post.create({ descrizione: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In metus velit, luctus vel scelerisque quis, commodo sed mauris. Cras finibus nunc nisl, eu molestie ligula hendrerit ut. Suspendisse potenti. In imperdiet volutpat laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id massa eget lacus dignissim placerat ac ut nunc. Donec ut ligula eleifend.', titolo: 'Visita al vaticansbro', data: '11/01/2023', ora: '10:00',
  lingua: 'Italiano', persone: '10', prezzo: '60', nomeC: 'Roma', regioneC: 'Lazio', nomeP: 'Roma', numero_ore: 3, user_email: 'sally@example.com', address: 'Via Nicola Salvi'})
p2 = Post.create({ descrizione: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In metus velit, luctus vel scelerisque quis, commodo sed mauris. Cras finibus nunc nisl, eu molestie ligula hendrerit ut. Suspendisse potenti. In imperdiet volutpat laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id massa eget lacus dignissim placerat ac ut nunc. Donec ut ligula eleifend.', titolo: 'Visita al vaticansbro2', data: '11/11/2024', ora: '10:00',
    lingua: 'Tedesco', persone: '15', prezzo: '80', nomeC: 'Formia', regioneC: 'Lazio', nomeP: 'Latina', numero_ore: 4, user_email: 'sue@example.com', address: 'Via Nicola Salvi 3'})
p3 = Post.create({ descrizione: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In metus velit, luctus vel scelerisque quis, commodo sed mauris. Cras finibus nunc nisl, eu molestie ligula hendrerit ut. Suspendisse potenti. In imperdiet volutpat laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id massa eget lacus dignissim placerat ac ut nunc. Donec ut ligula eleifend.', titolo: 'Visita al vaticansbro3', data: '11/06/2024', ora: '15:00',
    lingua: 'Inglese', persone: '8', prezzo: '50', nomeC: 'Napoli', regioneC: 'Campania', nomeP: 'Napoli', numero_ore: 2, user_email: 'jacke@example.com', address: 'Via della Minerva 1'})
p4 = Post.create({ descrizione: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In metus velit, luctus vel scelerisque quis, commodo sed mauris. Cras finibus nunc nisl, eu molestie ligula hendrerit ut. Suspendisse potenti. In imperdiet volutpat laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id massa eget lacus dignissim placerat ac ut nunc. Donec ut ligula eleifend.', titolo: 'Visita al vaticansbro4', data: '8/11/2024', ora: '10:00',
    lingua: 'Tedesco', persone: '15', prezzo: '80', nomeC: 'Formia', regioneC: 'Lazio', nomeP: 'Latina', numero_ore: 4, user_email: 'jacke@example.com', address: 'Via della Minerva 10'})
p5 = Post.create({ descrizione: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In metus velit, luctus vel scelerisque quis, commodo sed mauris. Cras finibus nunc nisl, eu molestie ligula hendrerit ut. Suspendisse potenti. In imperdiet volutpat laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id massa eget lacus dignissim placerat ac ut nunc. Donec ut ligula eleifend.', titolo: 'Visita al vaticansbro4', data: '8/04/2024', ora: '10:00',
    lingua: 'Tedesco', persone: '15', prezzo: '80', nomeC: 'Afragola', regioneC: 'Campania', nomeP: 'Napoli', numero_ore: 4, user_email: 'sue@example.com'})
p6 = Post.create({ descrizione: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In metus velit, luctus vel scelerisque quis, commodo sed mauris. Cras finibus nunc nisl, eu molestie ligula hendrerit ut. Suspendisse potenti. In imperdiet volutpat laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id massa eget lacus dignissim placerat ac ut nunc. Donec ut ligula eleifend.', titolo: 'Visita al tomba', data: '30/05/2023', ora: '15:15',
   lingua: 'Inglese', persone: '15', prezzo: '80', nomeC: 'Venezia', regioneC: 'Veneto', nomeP: 'Venezia', numero_ore: 4, user_email: 'jackel@example.com'})
p7 = Post.create({ descrizione: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In metus velit, luctus vel scelerisque quis, commodo sed mauris. Cras finibus nunc nisl, eu molestie ligula hendrerit ut. Suspendisse potenti. In imperdiet volutpat laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id massa eget lacus dignissim placerat ac ut nunc. Donec ut ligula eleifend.', titolo: 'Visita al tomba', data: '30/05/2023', ora: '08:15',
    lingua: 'Inglese', persone: '15', prezzo: '80', nomeC: 'Napoli', regioneC: 'Campania', nomeP: 'Napoli', numero_ore: 4, user_email: 'jackel@example.com'})
 
