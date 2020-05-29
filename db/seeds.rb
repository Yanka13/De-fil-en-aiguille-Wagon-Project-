# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Dropping database...'
Match.destroy_all
Project.destroy_all
Offer.destroy_all
Product.destroy_all
User.destroy_all

puts 'Creating 7 users (5 mask-makers, 2 professionnels de santé)...'

elise = User.new(
  first_name: "elise",
  last_name: "ddlt",
  nickname: "lili",
  email: "elise.dindault@gmail.com",
  password: "elise.dindault@gmail.com",
  address: "259B Avenue Daumesnil, 75012 Paris",
  category: "particulier",
  mask_maker: true,
  level: "Couturière Junior",
  photo: "https://avatars2.githubusercontent.com/u/60435372?v=4"
  )
elise.save

yannis = User.new(
  first_name: "yannis",
  last_name: "bou",
  nickname: "yaya",
  email: "yannis.bouhamou@hotmail.fr",
  password: "yannis.bouhamou@hotmail.fr",
  address: "12 Rue de la Roquette, 75011 Paris",
  category: "professionnel de santé",
  mask_maker: false,
  level: "Couturier Junior",
  photo: "https://avatars2.githubusercontent.com/u/61419311?v=4"
  )
yannis.save

jeremy = User.new(
  first_name: "jeremy",
  last_name: "barbedienne",
  nickname: "JeremyBRD",
  email: "jbarbedienne3@gmail.com",
  password: "jbarbedienne3@gmail.com",
  address: "35 Boulevard de Magenta, 75010 Paris",
  category: "particulier",
  mask_maker: true,
  level: "Couturier Junior",
  photo: "https://avatars2.githubusercontent.com/u/57770108?v=4"
  )
jeremy.save

soraya = User.new(
  first_name: "soraya",
  last_name: "benhaddou",
  nickname: "soso",
  email: "soraya-b55@hotmail.fr",
  password: "soraya-b55@hotmail.fr",
  address: "50 Rue Marcelin Berthelot, Alfortville, Île-de-France, France",
  category: "professionnel de santé",
  mask_maker: false,
  level: "Couturière Junior",
  photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1586765163/enwvenu4lyw4p00dearh.jpg"
  )
soraya.save

mike = User.new(
  first_name: "mike",
  last_name: "mmra",
  nickname: "mikey",
  email: "mikey@example.com",
  password: "mikey@example.com",
  address: "70 Rue Mazarine, 75006 Paris",
  category: "particulier",
  mask_maker: true,
  level: "Couturier Junior",
  photo: "https://kitt.lewagon.com/placeholder/users/krokrob"
  )
mike.save

anne = User.new(
  first_name: "anne",
  last_name: "loba",
  nickname: "annie",
  email: "annie@example.com",
  password: "annie@example.com",
  address: "42 rue vieille du temple, Paris",
  category: "particulier",
  mask_maker: true,
  level: "Couturière Junior",
  photo: "https://kitt.lewagon.com/placeholder/users/cveneziani"
  )
anne.save

claire = User.new(
  first_name: "claire",
  last_name: "loba",
  nickname: "claire",
  email: "claire@example.com",
  password: "claire@example.com",
  address: "42 rue du Chaffault, Paris",
  category: "particulier",
  mask_maker: true,
  level: "Couturière Junior",
  photo: "https://kitt.lewagon.com/placeholder/users/sarahlafer"

  )
claire.save

sebastien = User.new(
  first_name: "sebastien",
  last_name: "hobert",
  nickname: "seb",
  email: "sebastien@example.com",
  password: "sebastien@example.com",
  address: "6 Rue les Enfants du Paradis, Boulogne-Billancourt",
  category: "particulier",
  mask_maker: true,
  level: "Couturier Junior",
  photo: "https://kitt.lewagon.com/placeholder/users/arthur-littm"
  )
sebastien.save

eric = User.new(
  first_name: "eric",
  last_name: "pierrus",
  nickname: "eric-koh-lanta",
  email: "eric@example.com",
  password: "eric@example.com",
  address: "10 Rue de Fontenay, Nogent-sur-Marne",
  category: "particulier",
  mask_maker: true,
  level: "Couturier Junior",
  photo: "https://kitt.lewagon.com/placeholder/users/arthur-littm"
  )
eric.save


julia = User.new(
  first_name: "julia",
  last_name: "monnet",
  nickname: "julia",
  email: "julia@example.com",
  password: "julia@example.com",
  address: "10 Rue Henri Barbusse, Joinville-le-Pont, Île-de-France, France",
  category: "particulier",
  mask_maker: true,
  level: "Couturière de tonerre",
  photo: "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1494&q=80"
  )
julia.save

amine = User.new(
  first_name: "amine",
  last_name: "benaflex",
  nickname: "amine",
  email: "amine@example.com",
  password: "amine@example.com",
  address: "10 Rue Émile Bastard, Ivry-sur-Seine, Île-de-France, France",
  category: "particulier",
  mask_maker: true,
  level: "Couturier confirmé",
  photo: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
  )
amine.save

clara = User.new(
  first_name: "clara",
  last_name: "pamplette",
  nickname: "clara",
  email: "clara@example.com",
  password: "clara@example.com",
  address: "10 Rue de l'Arcade, Charenton-le-Pont, Île-de-France, France",
  category: "particulier",
  mask_maker: true,
  level: "Couturier Junior",
  photo: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"
  )
clara.save

yasmina = User.new(
  first_name: "yasmina",
  last_name: "pamplette",
  nickname: "yasmina",
  email: "yasmina@example.com",
  password: "yasmina@example.com",
  address: "13 Place Édouard Herriot, Le Kremlin-Bicêtre, Île-de-France, France",
  category: "particulier",
  mask_maker: true,
  level: "Couturier Junior",
  photo: "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1494&q=80"
  )
yasmina.save
puts 'Creating 3 products...'

masque = Product.new(
  product_type: "masque"
  )
masque.save

blouse = Product.new(
  product_type: "blouse"
  )
blouse.save

calot = Product.new(
  product_type: "calot"
  )
calot.save

puts 'Creating 8 offers...'

offer1 = Offer.new(
  user: elise,
  product: masque,
  quantity: 2,
  description: "pour ces masques j'ai suivi les recommandations de l'AFNOR, tissu léger pour laisser respirer",
  price: 0
)
offer1.save

offer2 = Offer.new(
  user: elise,
  product: calot,
  quantity: 1,
  description: "calot pour professionnel de santé, je peux en faire avec de jolis tissus si besoin 🧵🙂",
  price: 2
)
offer2.save

offer3 = Offer.new(
  user: mike,
  product: masque,
  quantity: 5,
  description: "masque aux normes AFNOR",
  price: 0

)
offer3.save

offer4 = Offer.new(
  user: jeremy,
  product: masque,
  quantity: 3,
  description: "masque fait par moi-même 😷",
  price: 2
)
offer4.save

offer5 = Offer.new(
  user: jeremy,
  product: blouse,
  quantity: 3,
  description: "blouses petite taille, tissu sobre",
  price: 2
)
offer5.save

offer6 = Offer.new(
  user: anne,
  product: masque,
  quantity: 0,
  description: "masques afnor sur mesure mp",
  price: 0
)
offer6.save

offer7 = Offer.new(
  user: claire,
  product: blouse,
  quantity: 0,
  description: "je fais des blouses quand g le temps",
  price: 0
)
offer7.save

offer8 = Offer.new(
  user: elise,
  product: blouse,
  quantity: 0,
  description: "je fais des blouses quand j'ai le temps",
  price: 0
)
offer8.save



offer9 = Offer.new(
  user: sebastien,
  product: masque,
  quantity: 10,
  description: "je fais des masques AFNOR en coton",
  price: 1.5
)
offer9.save


offer10 = Offer.new(
  user: eric,
  product: masque,
  quantity: 10,
  description: "Couturier de métier, je fais tout type de masque",
  price: 4
)

offer10.save

offer11 = Offer.new(
  user: julia,
  product: masque,
  quantity: 7,
  description: "Hello, je fais des masques sur mesure si besoin",
  price: 0
)

offer11.save


offer12 = Offer.new(
  user: amine,
  product: masque,
  quantity: 3,
  description: "masque confortable",
  price: 0
)

offer12.save

offer13 = Offer.new(
  user: clara,
  product: masque,
  quantity: 5,
  description: "blouse confortable et solide taille moyenne",
  price: 1
)

offer13.save

offer14 = Offer.new(
  user: yasmina,
  product: masque,
  quantity: 5,
  description: "Masque en lin !",
  price: 4
)

offer13.save
puts 'Creating 3 Projects...'



project2 = Project.new(
  user: soraya,
  product: masque,
  quantity: 40,
  deadline: "2020-04-10",
  budget: 80
)
project2.save



puts 'Creating 4 Matches...'


#YANNIS PROJET FINI !
match2 = Match.new(
  project: project2,
  offer: offer13,
  quantity: 5
)
match2.save

match3 = Match.new(
  project: project2,
  offer: offer14,
  quantity: 5
)
match3.save

match4 = Match.new(
  project: project2,
  offer: offer9,
  quantity: 10
)
match4.save


match5 = Match.new(
  project: project2,
  offer: offer10,
  quantity: 10
)
match5.save


match6 = Match.new(
  project: project2,
  offer: offer11,
  quantity: 7
)
match6.save


match7 = Match.new(
  project: project2,
  offer: offer12,
  quantity: 3
)
match7.save

puts 'Finished!'
