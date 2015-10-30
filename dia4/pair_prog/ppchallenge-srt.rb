require "pry"
require "date"

string_crude = IO.read("subtitle.srt")
array_crude = string_crude.split("\n")
array_procesed = array_crude.select {|string| string.include?("-->")}
array_reprocesed = array_procesed.map {|string| string.split(" --> ")}
#-------------------
array_times = array_reprocesed.each do|string_time|
	array_times = string_time.each do|string_time2|
		prueba = DateTime.parse(string_time2)

		binding.pry
	end
end

prueba_seconds = prueba.second
prueba_miliseconds = prueba.
