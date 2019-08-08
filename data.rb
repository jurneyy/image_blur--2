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

				puts @information[y_index][x_index]
				puts "y: #{y_index}, x: #{x_index}"
			end 
			change_top(y_index, x_index)
			puts " "
		end 
	end

	def change_top(row, column)
		#top
		@information[row-1][column] = 1 unless [row] !=-1
		#right
		@information[row][column+1] = 1 unless [column] != 4
		#Left
		@information[row][column-1] =1 
		#bottom
		@information[row+1][column] = 1 
	end 
end 


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])


image.blur_image	
image.change_top(row, column)



