class Image 

	def initialize(data)
		@information = data
	end

	def output_image

		@information.each do |x|

			print x.join("")
			print "\n"
		end
	end

	def blur_image

		@information.each_with_index do |row, y_index|

			row.each_with_index do |column, x_index|

				if @information[y_index][x_index] == 1 

					#top
					@information[y_index-1][x_index] = 1 unless y_index == -1
					#right
					@information[y_index][x_index+1] = 1 unless x_index == 3
					#Left
					@information[y_index][x_index-1] = 1 unless y_index == 2
					#bottom
					@information[y_index+1][x_index] = 1 unless y_index == 2
				end 

				#puts @information[y_index][x_index]
				#puts "y: #{y_index}, x: #{x_index}"
			end 
			puts " "
		end 	
	end 
end 

#while loop + 1 
#print

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

#image.output_image
image.blur_image
image.output_image





