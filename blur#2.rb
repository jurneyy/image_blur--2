class Image 
	attr_accessor :image 

	def initialize(image)
		@image = image
	end

	def output_image

		@image.each do |x|

			print x.join("")
			print "\n"
		end
	end

	def blur_image

		@image.each_with_index do |row, y_index|

			row.each_with_index do |column, x_index|

				puts @image[y_index][x_index]
				#puts "y: #{y_index}, x: #{x_index}"
			end 

			puts " "
		end 
	end

end 


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])


#image.blur_image
#image.change_top(row, column)

image.output_image
image.blur_image



