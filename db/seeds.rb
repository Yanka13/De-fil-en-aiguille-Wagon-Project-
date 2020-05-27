# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Dropping database...'
Offer.destroy_all
User.destroy_all
Product.destroy_all

puts 'Creating 5 users (3 mask-makers, 2 professionnels de santé)...'

elise = User.new(
  first_name: "elise",
  last_name: "ddlt",
  nickname: "lili",
  email: "elise.dindault@gmail.com",
  password: "elise.dindault@gmail.com",
  address: "259B Avenue Daumesnil, 75012 Paris",
  category: "particulier",
  mask_maker: true
  )
elise.save

yannis = User.new(
  first_name: "yannis",
  last_name: "bou",
  nickname: "yanou",
  email: "yannis.bouhamou@hotmail.fr",
  password: "yannis.bouhamou@hotmail.fr",
  address: "12 Rue de la Roquette, 75011 Paris",
  category: "professionnel de santé",
  mask_maker: false
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
  mask_maker: true
  )
jeremy.save

soraya = User.new(
  first_name: "soraya",
  last_name: "benhaddou",
  nickname: "soso",
  email: "soraya-b55@hotmail.fr",
  password: "soraya-b55@hotmail.fr",
  address: "11 Rue de la Verrerie, 75004 Paris",
  category: "professionnel de santé",
  mask_maker: false
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
  mask_maker: true
  )
mike.save

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

puts 'Creating 5 offers...'

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

puts 'Finished!'
