require 'pry'
class Home

	attr_reader(:name, :city, :country, :age)

	def initialize(name,city,country,age)
		@name = name
		@city = city
		@country = country
		@age = age
	end
end

homes = [
	Home.new("virgi","madrid","españa",40),
	Home.new("toni","barcelona","francia",45),
	Home.new("arturo","sevilla","alemania",30),
	Home.new("sonia","zaragoza","italia",25),
	Home.new("raquel","toledo","hungria",35),
]

# for pos in 0..4
# 	puts homes[pos].name
# 	puts homes[pos].city
# 	puts homes[pos].country
# 	puts homes[pos].age
# end

homes.each do |home|
	puts "#{home.name}`s place in #{home.city} \nAge: #{home.age} and country #{home.country}\n\n"
	
end

#------------ array with cities
puts "------------------"
cities = []
cities = homes.map { |home| home.country}
print cities

#----------------array with ages + average of ages
puts "------------------"
ages = []
ages = homes.map { |home| home.age}
print ages

puts "------------------"

total_age = ages.reduce do |sum,age|
	sum + age
end

average = total_age/ages.length
puts average

#----------------total age - with reduce
puts "------------------"
age_tot = homes.reduce(0.0) do |total,home|
	#binding.pry #if we place it after the next line, binding will return "nil", and nil+home.age ===>ERROR
	total + home.age
end

puts "the sum of all ages is "
puts age_tot

#------ reduce to calculate avg age
puts "------------------"

avg_age = homes.reduce(0) { |tot2,h| tot2 + h.age} / homes.length
puts avg_age















