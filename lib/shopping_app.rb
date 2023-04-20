require_relative "shopping_app/seller"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"

seller = Seller.new("DIC Store")
10.times{ Item.new("CPU", 40830, seller) }
10.times{ Item.new("mémoire", 13880, seller) }
10.times{ Item.new("carte mère", 28980, seller) }
10.times{ Item.new("PSU", 8980, seller) }
10.times{ Item.new("Boîtier PC", 8727, seller) }
10.times{ Item.new("Disque dur de 3,5 pouces", 10980, seller) }
10.times{ Item.new("SSD 2,5 pouces", 13370, seller) }
10.times{ Item.new("M.2 SSD", 12980, seller) }
10.times{ Item.new("Refroidisseur de CPU", 13400, seller) }
10.times{ Item.new("carte graphique", 23800, seller) }

puts "🤖 Quel est votre nom ?"
customer = Customer.new(gets.chomp)

puts "🏧 Saisir le montant à débiter sur le porte-monnaie"
customer.wallet.deposit(gets.chomp.to_i)

puts "🛍️Commencez à faire vos achats"
end_shopping = false
while !end_shopping do
  puts "📜 Liste des produits."
  seller.items_list

  puts "️️⛏ Veuillez saisir le numéro du produit"
  number = gets.to_i

  puts "⛏Veuillez indiquer la quantité de marchandises"
  quantity = gets.to_i

  items = seller.pick_items(number, quantity)

  items&.each{|item| customer.cart.add(item) }

  puts "🛒 Contenu du panier."
  customer.cart.items_list
  puts "🤑montant total: #{customer.cart.total_amount}"

  puts "😭 Voulez-vous terminer vos achats ?(yes/no)"
  end_shopping = gets.chomp == "yes"
end

puts "💸Voulez-vous finaliser l'achat ?(yes/no)"
customer.cart.check_out if gets.chomp == "yes"

puts "Le ୨ cousin ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ résultats ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈୨ cousin"
puts "️🛍️ ️#{customer.name}propriété de"
customer.items_list
puts "😱👛 #{customer.name}Solde du portefeuille de: #{customer.wallet.balance}"

puts "📦 #{seller.name}État des stocks de"
seller.items_list
puts "😻👛 #{seller.name}Solde du portefeuille de: #{seller.wallet.balance}"

puts "🛒 Contenu du panier."
customer.cart.items_list
puts "🌚 montant total: #{customer.cart.total_amount}"

puts "🎉fin"
