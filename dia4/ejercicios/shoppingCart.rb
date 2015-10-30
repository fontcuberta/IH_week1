require 'pry'

class ShoppingCart

	def initialize(catalogue)
		@catalogue = catalogue
		@my_shop = []
		@my_fruit = {}
	end



	# def add_item_to_cart(fruit) ONLY FOR BAD HASHES
	# 	@catalogue.each do |f|
				
	# 		if f.has_key?(fruit)
	# 			@my_fruit[fruit] = f[fruit]
	# 			@my_shop <<  @my_fruit
	# 		end
	# 	end
	# 	@my_fruit = {}
	# end

	def add_item_to_cart(fruit)
		@catalogue.each do |f|
			if f[:name] == fruit
				@my_shop << f
			end
		end
		# binding.pry
	end

	def cost
		total = 0
		provisional_name = ""
		num_fruits = 0
		@my_shop.each do |f|
			provisional_name = f[:name]
			binding.pry
			if f[:name]
				total+=1
			end
				 

			total+= f.values[0]
		end
		return total
	end
	
	def show
		amount = 0
		partial_price = 0
		@my_shop.each_with_index do |f|
			
		end
	end
end

# binding.pry

list_fruits = [{:name => "apples", :price => 10},
	{:name => "oranges", :price => 10},
	{:name => "grapes", :price => 10},
	{:name => "banana", :price => 10},
	{:name => "watermelon", :price => 10}]

my_cart = ShoppingCart.new(list_fruits)
my_cart.add_item_to_cart("apples")
my_cart.add_item_to_cart("apples")
my_cart.add_item_to_cart("watermelon")
puts my_cart.cost


