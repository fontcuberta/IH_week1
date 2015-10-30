require 'pry'
#modulos siempre arriba
module Photos
	def take_pictures
		"Photo taken in #{@so}"
	end
end

class Device
	def initialize(so,inches)
		@so = so
		@inches = inches
		@time = Time.now
	end

	def print_currenTime
		@time
	end

end


class Phone < Device

	include Photos

	def initialize(so,inches,_agenda)
		super(so,inches)

		@agenda = _agenda
		@new_contact = []
	end

	def add_contact_to_agenda()
		puts "enter name"
		last_position = @agenda.contact_list.length
		@new_contact[0] = gets.chomp

		puts "enter telephone number"
		@new_contact[1] = gets.chomp
		binding.pry
		@agenda.contact_list << @new_contact
		@new_contact = []
		puts "more contact?  Y / N"
		continue = gets.chomp.downcase
		if continue == "y"
			add_contact_to_agenda
		end
	end
# ------------------------------------
					#Solucion quino usando un hash, que permitiria futuros cambios mejor
					def add_cont name,telephone,
						@agenda << {name: name, telephone: telephone}
					end

					def get_contact name
						@agenda.add_contact_quino
						# number_found = ""
						# @agenda.each do |contact|
						# 	if contact[:name] == name
						# 		number_found = contact[:name]
						# 	end
						# end
						# return number_found
					end

					def call name
						number = get_contact(name)
						puts "calling #{number}"
					end
# ------------------------------------


	def call_someone(name)

		@agenda.contact_list.each do |contact|
			if contact[0] == name
				puts "the telephone is : " + contact[1].to_s
				return
			else
				puts "that contact doesn´t exist"
			end
		end

	end
end

class Agenda
# ------------------------------------
	attr_accessor :contact_list # quino no pasa este valor, ya que va retornado en cada funcion
# ------------------------------------

	def initialize(agenda_name)
		@agenda_name = agenda_name
		@contact_list = [] # no llamarlo "agenda", para evitar redundancias - claridad !
		@par = []
		
	end

	def add_contact
		puts "enter name"
		@par[0] = gets.chomp
		puts "enter telephone number"
		@par[1] = gets.chomp

		@contact_list << @par
		@par = []
		
		puts "more contact?  Y / N"
		continue = gets.chomp.downcase
		if continue == "y"
			add_contact
		end
	end
# ------------------------------------
	def add_contact_quino
	end
# ------------------------------------


end

# my_agenda = Agenda.new("trabajo")
# # my_agenda.add_contact

# my_phone = Phone.new("nokia_os",5,my_agenda)
# my_phone.call_someone("virgi")
# my_phone.add_contact_to_agenda
# puts my_phone.take_pictures


# we don´t use an inner agenda cause we may need it somewhere else(laptop/tablet...)
#so we pass it to the "Phone" class as an injection
# class Phone < Device
# 	def initialize(so,inches)
# 		super(so,inches)
# 		@telefono = ""
# 		@nombre = ""
# 		@agenda = []
# 		@par = []
# 	end

# 	def add_contacts()
# 		puts "enter name"
# 		@nombre = gets.chomp
# 		@par << @nombre

# 		puts "enter telephone number"
# 		@telefono = gets.chomp
# 		@par << @telefono

# 		@agenda << @par

# 		puts "more contact?  Y / N"
# 		continue = gets.chomp.downcase
# 		if continue == "y"
# 			add_contacts
# 		end
# 	end

# 	def call_someone(name)
# 		@agenda.each do |contact|
# 			binding.pry
# 			if contact[0].to_s == name
# 				puts "the telephone is : " + contact[1].to_s
# 			else
# 				puts "that contact doesn´t exist"
# 			end
# 		end

# 	end
# end

class Laptop < Device
	attr_accessor :touchable

	def initialize(so,inches,touchable)
		super(so,inches)
		@touchable = touchable
	end
end


class Smartwatch < Device
	
	include Photos
# ------------------------------------

	# no hace falta porque es exactamente igual que el del padre "Device" !!!!!
	# def initialize(so,inches)
	# 	super(so,inches)
	# end
# ------------------------------------

	def print_currenTime
		 "*** #{@time} ***"
	end

end

class Microwave #no tiene sentido que herede, ya que solo comparte print_Time

	def initialize
		@time = Time.now
	end

	def print_currenTime
		@time #quino --> puts "I´m a microwave #{@time}"
	end

	def heat_food
		puts "heating food"
	end
end

# my_device = Device.new("windows",24)
# my_device.print_currenTime

# my_phone = Phone.new("mac",33)
# puts my_phone.print_currenTime
# my_phone.add_contacts
# my_phone.call_someone("toni")

# my_laptop = Laptop.new("linux",23,true)
# puts my_laptop.touchable
# puts "-------------"

# my_smartwatch = Smartwatch.new("android",6)
# my_smartwatch.fancyprint

puts "-------------"
my_device = Device.new("windows",24)
my_laptop = Laptop.new("linux",23,true)
my_smartwatch = Smartwatch.new("android",6)
my_micro = Microwave.new
my_agenda = Agenda.new("trabajo")
my_phone = Phone.new("nokia_os",5,my_agenda)




my_collection = []
my_collection << my_device
my_collection << my_phone
my_collection << my_laptop
my_collection << my_smartwatch
my_collection << my_micro

my_collection.each do |dev|
	puts dev.print_currenTime
end





