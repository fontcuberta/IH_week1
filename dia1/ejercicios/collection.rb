require 'pry'
# iteration 0

class Home

	attr_reader(:name, :city, :price, :capacity)

	def initialize(name,city,price,capacity)
		@name = name
		@city = city
		@price = price
		@capacity = capacity
	end
end

homes = [
	Home.new("mansion","madrid",200,10),
	Home.new("palacio","barcelona",210,25),
	Home.new("caserio","sevilla",140,20),
	Home.new("choza","zaragoza",30,3),
	Home.new("duplex","toledo",110,60),
	Home.new("duplex","madrid",180,60),
	Home.new("mansion","toledo",200,60),
	Home.new("caserio","oviedo",110,16),
	Home.new("choza","sevilla",20,6),
	Home.new("palacio","segovia",300,30)
]

# iteration 1 - list of homes

homes.each do |home|
	puts "name : #{home.name} city: #{home.city} \nprice: #{home.price} capacity #{home.capacity}\n\n"
end

# iteration 2 - sorting by price

puts "como prefieres visualizar los datos"
puts "opciones --> 'price' or 'capacity' "
respuesta = gets.chomp

if respuesta == 'price'

	sorted_price = homes.sort do |price1,price2|
		price2.price <=> price1.price
	end

	puts "como quieres el orden de los resultados - 'mayor' / 'menor' "
	respuesta2 = gets.chomp

	if respuesta2 == 'mayor'
		sorted_price.each do |property|
			puts property.price
		end
	else
		sorted_price.reverse.each do |property|
			puts property.price
		end
	end
elsif respuesta == 'capacity'
	sorted_capacity = homes.sort do |capacity1,capacity2|
		capacity2.capacity <=> capacity1.capacity
	end

	sorted_capacity.each do |cap|
			puts cap.capacity
		end
else
	puts "no entendi el resultado"
end


# iteration 3 - filter by city

puts "ordenemos por ciudades, elige entre las siguientes"
homes.each do |home|
	puts "#{home.city} "
end
ciudad = gets.chomp


ciudades_elegidas = homes.select do |home|
  home.city == "#{ciudad}"
end

ciudades_elegidas.each do |home|
	puts "name : #{home.name} city: #{home.city} \nprice: #{home.price} capacity #{home.capacity}\n\n"
end


# iteration 4 - average

average_price = (ciudades_elegidas.reduce(0) {|sum,house| sum + house.price}) / ciudades_elegidas.length
puts "the avg price is #{average_price}"



#iteration 5 - name your own price

puts "veamos si ya existe ese precio"
user_price = gets.chomp.to_i

existe = homes.find do |home|
		home.price == user_price
	end

if existe
	puts "name : #{existe.name} city: #{existe.city} \nprice: #{existe.price} capacity #{existe.capacity}\n\n"
else
	puts "no existe propiedad con ese precio"
end

# iteration 6 - get all the houses under a price

puts "dime los precios en los que estas interesado"
user_price = gets.chomp.to_i

check_houses = homes.select do |home|
  home.price <= user_price
end

check_houses.each do |selection|
		puts "name : #{selection.name} city: #{selection.city} \nprice: #{selection.price} capacity #{selection.capacity}\n\n"
end











