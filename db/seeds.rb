# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
##   Character.create(name: "Luke", movie: movies.first)
r1 = Role.create({ id: 9, name: 'Tourist', description: 'Can search for guides, normal user' })
r2 = Role.create({ id: 10, name: 'Guide', description: 'Can post tour announcements and do his job on the platform' })

u1 = User.create({name: "sae", email: "sae@example.it", password: "aaaaaaaa"})

p1 = Post.create({descrizione: "Ciao", titolo: "Ciao ciao", data: "12/12/2024", lingua: "italiano", persone: "15",
  prezzo: "50", nomeC: "Roma", regioneC: "Lazio", nomeP: "Roma", numero_ore: "3", user_email: "sae@example.it", address: "
  Via della Brianza 2"})
p2 = Post.create({descrizione: "Ciao", titolo: "Ciao ciao", data: "12/12/2024", lingua: "italiano", persone: "15",
    prezzo: "50", nomeC: "Roma", regioneC: "Lazio", nomeP: "Roma", numero_ore: "3", user_email: "sae@example.it", address: "
    Via della Brianza 2"})
p3 = Post.create({descrizione: "Ciao", titolo: "Ciao ciao", data: "12/12/2024", lingua: "italiano", persone: "15",
      prezzo: "50", nomeC: "Roma", regioneC: "Lazio", nomeP: "Roma", numero_ore: "3", user_email: "sae@example.it", address: "
      Via della Brianza 2"})
p4 = Post.create({descrizione: "Ciao", titolo: "Ciao ciao", data: "12/12/2024", lingua: "italiano", persone: "15",
        prezzo: "50", nomeC: "Roma", regioneC: "Lazio", nomeP: "Roma", numero_ore: "3", user_email: "sae@example.it", address: "
        Via della Brianza 2"})
p5 = Post.create({descrizione: "Ciao", titolo: "Ciao ciao", data: "12/12/2024", lingua: "italiano", persone: "15",
          prezzo: "50", nomeC: "Roma", regioneC: "Lazio", nomeP: "Roma", numero_ore: "3", user_email: "sae@example.it", address: "
          Via della Brianza 2"})