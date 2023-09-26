#THIS SEED HAS BEEN USED IN ORDER TO VERIFY THE CORRECTNESS OF THE check_date_job, THE JOB USEFUL TO
#SEND AN EMAIL WHEN YOU CAN'T ASK FOR A REFUND ANYMORE

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
##   Character.create(name: "Luke", movie: movies.first)
r1 = Role.create({ id: 9, name: 'Tourist', description: 'Can search for guides, normal user' })
r2 = Role.create({ id: 10, name: 'Guide', description: 'Can post tour announcements and do his job on the platform' })

u1 = User.create({ name: 'Sally', email: 'sally@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u2 = User.create({ name: 'Sue', email: 'alessandrosaccone96@gmail.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u3 = User.create({ name: 'Kev', email: 'kev@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u4 = User.create({ name: 'Jack', email: 'jack@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r1.id})
u5 = User.create({ name: 'Jackel', email: 'jackel@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: 10, lat: 41.9079616, long: 12.514760, stripe_account_id: 'acct_1N74unPLkNCoVoUm'})
u6 = User.create({ name: 'Alesacco', email: 'alessandrosaccone96@gmail.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r1.id})

l1=Language.create(name: "Francese")
l2=Language.create(name:"Italiano")
l3=Language.create(name:"Inglese")

bacheca1 = BachecaGuida.create({user_id: 1})
bacheca2 = BachecaGuida.create({user_id: 2})
bacheca3 = BachecaGuida.create({user_id: 3})
bacheca4 = BachecaUtente.create({user_id: 4})
bacheca5 = BachecaGuida.create({user_id: 5})
bacheca6 = BachecaUtente.create({user_id: 6})


c1=City.create(name: "Roma", region: "Lazio")
c2=City.create(name: "Frosinone", region: "Lazio")

u1.city=c1;
u1.save;
u2.city=c2;
u2.save;
u3.city=c1;
u3.save;
u4.city=c1;
u4.save;
u5.city=c2;
u5.save;

p1 = Post.create({ descrizione: 'Lorem ipsum', titolo: 'Esempio', data: '25/09/2023', ora: '22:58',
  lingua: 'Italiano', persone: '10', prezzo: '60', nomeC: 'Roma', regioneC: 'Lazio', nomeP: 'Roma', numero_ore: 3, user_email: 'sally@example.com', address: 'Via Nicola Salvi', user_id: u1.id})
p2 = Post.create({ descrizione: 'Lorem ipsum', titolo: 'Esempio', data: '27/09/2023', ora: '23:34',
    lingua: 'Tedesco', persone: '15', prezzo: '80', nomeC: 'Formia', regioneC: 'Lazio', nomeP: 'Latina', numero_ore: 4, user_email: 'alessandrosaccone96@gmail.com', address: 'Via Nicola Salvi 3', user_id: u2.id})
p3 = Post.create({ descrizione: 'Lorem ipsum', titolo: 'Esempio', data: '11/06/2024', ora: '15:00',
    lingua: 'Inglese', persone: '8', prezzo: '50', nomeC: 'Napoli', regioneC: 'Campania', nomeP: 'Napoli', numero_ore: 2, user_email: 'jackel@example.com', address: 'Via della Minerva 1', user_id: u5.id})
p4 = Post.create({ descrizione: 'Lorem ipsum', titolo: 'Esempio', data: '8/11/2024', ora: '10:00',
    lingua: 'Tedesco', persone: '15', prezzo: '80', nomeC: 'Firenze', regioneC: 'Toscana', nomeP: 'Firenze', numero_ore: 4, user_email: 'jackel@example.com', address: 'Via della Minerva 10',user_id: u5.id})
p5 = Post.create({ descrizione: 'Lorem ipsum', titolo: 'Esempio', data: '8/11/2024', ora: '10:00',
    lingua: 'Tedesco', persone: '15', prezzo: '80', nomeC: 'Formia', regioneC: 'Lazio', nomeP: 'Latina', numero_ore: 4, user_email: 'sue@example.com', user_id: u2.id})
p6 = Post.create({ descrizione: 'Evviva la vita 3', titolo: 'Esempio', data: '30/05/2023', ora: '15:15',
   lingua: 'Inglese', persone: '15', prezzo: '80', nomeC: 'Roma', regioneC: 'Lazio', nomeP: 'Roma', numero_ore: 4, user_email: 'jackel@example.com',user_id: u5.id})
p7 = Post.create({ descrizione: 'Evviva la vita 3', titolo: 'Esempio', data: '30/05/2023', ora: '08:15',
    lingua: 'Inglese', persone: '15', prezzo: '80', nomeC: 'Gaeta', regioneC: 'Lazio', nomeP: 'Latina', numero_ore: 4, user_email: 'jackel@example.com',user_id: u5.id})
 
b1 = Booking.create({user_id: 2, post_id: 1, stripe_charge_id: 000, num_pers: 1, amount: 1, expired: true})
b1 = Booking.create({user_id: u6.id, post_id: p1.id, expired: false, num_pers: 1, refunded: false})
b2 = Booking.create({user_id: u6.id, post_id: p1.id, expired: true, num_pers: 1, refunded: false})
b3 = Booking.create({user_id: u6.id, post_id: p1.id, expired: false, num_pers: 1, refunded: true})
b4 = Booking.create({user_id: u6.id, post_id: p2.id, expired: false, num_pers: 1, refunded: false})
